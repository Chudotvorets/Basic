//
//  LoginViewController.swift
//  Basic project
//
//  Created by SIMONOV on 29.06.2022.
//

import Foundation

import UIKit
import SnapKit
import WebKit

class LoginViewController: UIViewController {
    
    private var token: Token?
    
    private var networkService = NetworkService()
    
    private lazy var webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureURL()
        configureLoginView()
    }
    
    private func configureURL() {
        guard let url = URL(string: "https://unsplash.com/oauth/authorize?client_id=\(Data.clientID)&redirect_uri=\(Data.redirectURL)&response_type=code&scope=public") else { return }
        
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
    }
    
    private func configureLoginView() {
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let absoluteURL = webView.url?.absoluteString.components(separatedBy: "?"),
              absoluteURL[0] == "\(Data.redirectURL)/" else {
            return
        }
        let keyAndCode = absoluteURL[1].components(separatedBy: "=")
        let code = keyAndCode[1]
        print("absolute URL = \(absoluteURL)")
        print("absolute URL = \(keyAndCode)")
        print("absolute URL = \(code)")
        self.networkService.getTocken(code: code) { [weak self] data in
            self?.token = data
            let TabBarController = CustomTabBar()
            TabBarController.modalPresentationStyle = .fullScreen
            self?.present(TabBarController, animated: true)
        }
    }
}

