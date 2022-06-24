//
//  UserRegistrationPresenter.swift
//  Basic project
//
//  Created by SIMONOV on 14.06.2022.
//

import Foundation

protocol RegistrationViewProtocol: AnyObject {
   
}

protocol RegistrationPresenterProtocol: AnyObject {
    func setDataLoginModule()
    func choseData(name: String, password: String, email: String, city: String, gender: GenderType)
    func backButton()
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    
   
    var router: RouterProtocol?
    weak var view: RegistrationViewProtocol?
    
    init(router: RouterProtocol) {
        
        self.router = router
    }
    
    func backButton() {
        router?.popToRoot()
    }
    
    func choseData(name: String, password: String, email: String, city: String, gender: GenderType) {
        let userObject = UserModel(name: name, password: password, email: email, city: city, gender: gender)
        UserSettings.userModel = userObject
       
    }
    
    func setDataLoginModule() {
        
    }
    
}
