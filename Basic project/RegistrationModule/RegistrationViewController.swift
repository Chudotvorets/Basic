//
//  UserRegistrationViewController.swift
//  Basic project
//
//  Created by SIMONOV on 14.06.2022.
//


import UIKit
import SnapKit



class RegistationViewController: UIViewController, RegistrationViewProtocol {
    
    //MARK: - property
    
    var presentor: RegistrationPresenterProtocol
    
    let cities = ["Изенгард", "Мория", "Гундабад", "Дуртанг", "Шир"]
    var choseAge: String?
    var choseCity: String?
    var choseGender: GenderType?

    
    private lazy var nameStackView: UIStackView = {
        let nameStackView = UIStackView()
        nameStackView.backgroundColor = .clear
        
        return nameStackView
    }()
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.text = "Имя"
        name.textAlignment = .left
        name.font = .systemFont(ofSize: 15)
        
        return name
    }()
    
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 5
        nameTextField.font = .systemFont(ofSize: 20)
        
        return nameTextField
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let passwordStackView = UIStackView()
        passwordStackView.backgroundColor = .clear
        
        return passwordStackView
    }()
    
    private lazy var password: UILabel = {
        let password = UILabel()
        password.textColor = .black
        password.text = "Пароль"
        password.textAlignment = .left
        password.font = .systemFont(ofSize: 15)
        
        return password
    }()
    
    private lazy var passwordTextField: UITextField = {
        let surNameTextField = UITextField()
        surNameTextField.backgroundColor = .white
        surNameTextField.layer.cornerRadius = 5
        surNameTextField.font = .systemFont(ofSize: 20)
        return surNameTextField
    }()
    
    private lazy var emailStackView: UIStackView = {
        let emailStackView = UIStackView()
        emailStackView.backgroundColor = .clear
        
        return emailStackView
    }()
    
    private lazy var email: UILabel = {
        let email = UILabel()
        email.textColor = .black
        email.text = "Почта"
        email.textAlignment = .left
        email.font = .systemFont(ofSize: 15)
        
        return email
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.backgroundColor = .white
        emailTextField.layer.cornerRadius = 5
        emailTextField.font = .systemFont(ofSize: 20)
        
        return emailTextField
    }()
    
    private lazy var city: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.text = "Город"
        name.textAlignment = .left
        name.font = .systemFont(ofSize: 15)
        
        return name
    }()
    
    private lazy var cityPickerView = UIPickerView()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Мужской", "Женский"])
        
        return segmentedControl
    }()
    
    init(presentor: RegistrationPresenterProtocol) {
    self.presentor = presentor
    super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.isHidden = false
        navigationBar()
        barBattonItem()
        configuresConstraints()
        
        
    }
    //MARK: - constraint
    private func configuresConstraints() {
        
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        view.addSubview(cityPickerView)
        cityPickerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(segmentedControl).inset(100)
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(150)
        }
        
        view.addSubview(nameStackView)
        nameStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(150)
            make.width.equalToSuperview().inset(10)
            make.height.equalTo(80)
        }
        
        nameStackView.addSubview(name)
        name.snp.makeConstraints { make in
            make.centerX.equalTo(nameStackView)
            make.top.equalTo(nameStackView).inset(10)
            make.width.equalTo(nameStackView).inset(10)
            make.height.equalTo(20)
        }
        
        nameStackView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(nameStackView)
            make.top.equalTo(name).inset(30)
            make.width.equalTo(nameStackView).inset(10)
            make.height.equalTo(50)
        }
        
       view.addSubview(passwordStackView)
        passwordStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameStackView).inset(80)
            make.width.equalToSuperview().inset(10)
            make.height.equalTo(80)
        }
        
        passwordStackView.addSubview(password)
        password.snp.makeConstraints { make in
            make.centerX.equalTo(passwordStackView)
            make.top.equalTo(passwordStackView).inset(10)
            make.width.equalTo(passwordStackView).inset(10)
            make.height.equalTo(20)
        }
        
        passwordStackView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(passwordStackView)
            make.top.equalTo(password).inset(30)
            make.width.equalTo(passwordStackView).inset(10)
            make.height.equalTo(50)
        }
        
        view.addSubview(emailStackView)
         emailStackView.snp.makeConstraints { make in
             make.centerX.equalToSuperview()
             make.top.equalTo(passwordStackView).inset(80)
             make.width.equalToSuperview().inset(10)
             make.height.equalTo(80)
         }
         
         emailStackView.addSubview(email)
         email.snp.makeConstraints { make in
             make.centerX.equalTo(emailStackView)
             make.top.equalTo(emailStackView).inset(10)
             make.width.equalTo(emailStackView).inset(10)
             make.height.equalTo(20)
         }
         
         emailStackView.addSubview(emailTextField)
         emailTextField.snp.makeConstraints { make in
             make.centerX.equalTo(emailStackView)
             make.top.equalTo(email).inset(30)
             make.width.equalTo(emailStackView).inset(10)
             make.height.equalTo(50)
         }
        
        view.addSubview(city)
        city.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(cityPickerView).inset(100)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }

    }
    
    //MARK: - methods
    
    private func navigationBar() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector (popToRoot))
    }
    
    @objc
    func popToRoot() {
        presentor.backButton()
    }
    
   private func barBattonItem() {
        
        self.navigationItem.titleView?.tintColor = .black
        self.navigationItem.title = "Регистрация"
       self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveData))
    }
    
    @objc
    func saveData() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            choseGender = .male
        case 1:
            choseGender = .female
        default:
            break
        }
        
        let nameTrimmingText = nameTextField.text!.trimmingCharacters(in: .whitespaces)
        let passwordTrimmingText = passwordTextField.text!.trimmingCharacters(in: .whitespaces)
        let emailTrimmingText = emailTextField.text!.trimmingCharacters(in: .whitespaces)
        guard let choseCity = choseCity, let choseGender = choseGender else { return }
        
        presentor.choseData(name: nameTrimmingText, password: passwordTrimmingText, email: emailTrimmingText, city: choseCity, gender: choseGender)
        
        
        
        print(nameTrimmingText)
       }
    }

extension RegistationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let city = cities[row]
        return city
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choseCity = cities[row]
        
    }
}


