//
//  AutorizationPresentor.swift
//  Basic project
//
//  Created by SIMONOV on 14.06.2022.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    
}

protocol LoginPresenterProtocol: AnyObject {
    
    func transitionToRegistration()
    func returnContent() -> [String]
    func nameConformityCheck() -> String
    func passwordConformityCheck() -> String
    func transitionToTabBar()

}

class LoginPresentor: LoginPresenterProtocol {
    
    
    var router: RouterProtocol?
    weak var view: LoginViewProtocol?
    
    init( router: RouterProtocol) {
        
        self.router = router
    }
     
    
    internal func nameConformityCheck() -> String {
        return UserSettings.userModel.name
       
    }
    
    internal func passwordConformityCheck() -> String {
        return UserSettings.userModel.password
        
    }
    
    internal func returnContent() -> [String] {
        let name = UserSettings.userModel.name
        let password = UserSettings.userModel.password
        let loginArray = [name, password]
        return loginArray
        
    }
    
    internal func transitionToTabBar() {
        router?.showTabBarController()
    }
    
    internal func transitionToRegistration() {
        router?.showRegistration()
    }
}
 
