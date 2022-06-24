//
//  ModulBuilder.swift
//  Basic project
//
//  Created by SIMONOV on 14.06.2022.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func creatLoginModule(router: RouterProtocol) -> UIViewController
    func creatRegistrationModule(router: RouterProtocol) -> UIViewController
    func creatDetailModul()
    func creatCustomTabBar() -> UITabBarController
   
}

class ModulBuilder: BuilderProtocol {
    
    
    func creatDetailModul() {
        
    }
    
    func creatCustomTabBar() -> UITabBarController {
        let tabBarController = CustomTabBar()
        tabBarController.selectedIndex = 0
        return tabBarController
    }

    func creatLoginModule(router: RouterProtocol) -> UIViewController {
        let presentor = LoginPresentor(router: router)
        let view = LoginViewController(presentor: presentor)
        return view
    }
    
    func creatRegistrationModule(router: RouterProtocol) -> UIViewController {
        let presentor = RegistrationPresenter(router: router)
        let view = RegistationViewController(presentor: presentor)
        return view
    }
 
    
}
