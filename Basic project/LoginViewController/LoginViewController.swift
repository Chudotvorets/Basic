//
//  LoginViewController.swift
//  Basic project
//
//  Created by SIMONOV on 02.07.2022.
//

import UIKit
import SnapKit
import WebKit

//MARK: - LoginViewController
class LoginViewController: UIViewController {
    
    //MARK: - Properties
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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingURL()
        installationLoginView()
    }
    
    //MARK: - Methods
    private func settingURL() {
        
        guard let url = URL(string: "https://unsplash.com/oauth/authorize?client_id=\(UserData.clientID)&redirect_uri=\(UserData.redirectURL)&response_type=code&scope=public") else { return }
        
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
    }
    
    private func installationLoginView() {
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - WKNavigationDelegate
extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let absoluteURL = webView.url?.absoluteString.components(separatedBy: "?"),
              absoluteURL[0] == UserData.redirectURL else {
            return
        }
        let keyAndCode = absoluteURL[1].components(separatedBy: "=")
        let code = keyAndCode[1]
        
        self.networkService.getTocken(code: code) { [weak self] data in
            self?.token = data
            let tabBarController = CustomTabBar()
            tabBarController.modalPresentationStyle = .fullScreen
            self?.present(tabBarController, animated: true)
        }
    }
}
