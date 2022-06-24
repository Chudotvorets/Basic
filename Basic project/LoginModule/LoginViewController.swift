//
//  ApplicationLoginViewController.swift
//  Basic project
//
//  Created by SIMONOV on 14.06.2022.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController, LoginViewProtocol {
    
    
    var presentor: LoginPresenterProtocol
    
    //MARK: - property
    
    private lazy var stackView: UIStackView = {
        let nameStackView = UIStackView()
        nameStackView.backgroundColor = .white
        nameStackView.alpha = 0.9
        nameStackView.layer.cornerRadius = 20
        
        return nameStackView
    }()
    
    private lazy var registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.backgroundColor = .systemGray2
        registrationButton.setTitleShadowColor(.white, for: .normal)
        registrationButton.setTitleColor(.white, for: .normal)
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.addTarget(self, action: #selector(goToRegistration), for: .touchUpInside)
        registrationButton.layer.cornerRadius = 12
        
        return registrationButton
    }()
    
    private lazy var myImageView: UIImageView = {
        let myImageView = UIImageView(frame: view.bounds)
        myImageView.image = UIImage(named: "BIGPIC11")
        myImageView.contentMode = .scaleAspectFill
        return myImageView
    }()
    
    private lazy var alertLabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.text = "Введите имя и пароль"
        alertLabel.textAlignment = .center
        alertLabel.textColor = .black
        alertLabel.font = .systemFont(ofSize: 20)

        return alertLabel
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        let placeholderText = NSAttributedString(string: "Имя",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        loginTextField.attributedPlaceholder = placeholderText
        loginTextField.textColor = .white
        loginTextField.backgroundColor = .systemGray2
        loginTextField.layer.cornerRadius = 10
        loginTextField.font = .systemFont(ofSize: 20)
        
        return loginTextField
    }()

    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        let placeholderText = NSAttributedString(string: "Пароль",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = placeholderText
        passwordTextField.textColor = .white
        passwordTextField.backgroundColor = .systemGray2
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.font = .systemFont(ofSize: 20)
        
        return passwordTextField
    }()
    
    private lazy var autorizationButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .systemGray2
        button.setTitleShadowColor(.white, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(checkToAutorize), for: .touchUpInside)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    init(presentor: LoginPresenterProtocol) {
    self.presentor = presentor
    super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myImageView)
        configureConstraints()
    
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setContent()
        super.viewWillAppear(animated)
    }
    
    //MARK: - constraints
    
    private func configureConstraints() {
    
    view.addSubview(stackView)
    stackView.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.top.equalToSuperview().inset(250)
        make.width.equalToSuperview().inset(30)
        make.height.equalTo(300)
        }
    
    stackView.addSubview(alertLabel)
    alertLabel.snp.makeConstraints { make in
        make.centerX.equalTo(stackView)
        make.top.equalTo(stackView).inset(20)
        make.width.equalTo(stackView).inset(5)
        make.height.equalTo(20)
        }
    
    stackView.addSubview(loginTextField)
    loginTextField.snp.makeConstraints { make in
        make.centerX.equalTo(stackView)
        make.top.equalTo(alertLabel).inset(50)
        make.width.equalTo(stackView).inset(20)
        make.height.equalTo(30)
        }
        
    stackView.addSubview(passwordTextField)
    passwordTextField.snp.makeConstraints { make in
        make.centerX.equalTo(stackView)
        make.top.equalTo(loginTextField).inset(50)
        make.width.equalTo(stackView).inset(20)
        make.height.equalTo(30)
        }
        
    stackView.addSubview(autorizationButton)
    autorizationButton.snp.makeConstraints { make in
        make.centerX.equalTo(stackView)
        make.top.equalTo(passwordTextField).inset(50)
        make.width.equalTo(stackView).inset(100)
        make.height.equalTo(30)
        }
        
    stackView.addSubview(registrationButton)
    registrationButton.snp.makeConstraints { make in
        make.centerX.equalTo(stackView)
        make.top.equalTo(autorizationButton).inset(50)
        make.width.equalTo(stackView).inset(100)
        make.height.equalTo(30)
        }
        
    }
    
    // MARK: - @IBAction
    
    
    @objc
    private func setContent () {
        let content = presentor.returnContent()
        loginTextField.text = content[0]
        passwordTextField.text = content[1]
        
    }
    
    @objc
    private func goToRegistration() {
        presentor.transitionToRegistration()
    }
    
    private func errorLogin() {
        alertLabel.isHidden = false
        alertLabel.textColor = .red
        alertLabel.shadowColor = .white
        alertLabel.text = "Неверное имя или пароль"
        
        
    }
    
    @objc private func checkToAutorize()  {
        if loginTextField.text?.lowercased() == "" && passwordTextField.text?.lowercased() == "" {
            print("empty")
        } else if loginTextField.text ==  presentor.nameConformityCheck() && passwordTextField.text == presentor.passwordConformityCheck() {
            
            presentor.transitionToTabBar()
            
        } else {
            
            errorLogin()
        }
    }
}

    
    

