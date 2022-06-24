//
//  Router.swift
//  Basic project
//
//  Created by SIMONOV on 14.06.2022.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController { get set }
    var assemblyBuilder: BuilderProtocol? { get set }
}
protocol RouterProtocol {
    func initalViewController()
    func showRegistration()
    func showTabBarController()
    func popToRoot()
    
    
}
class Router: RouterProtocol {


    var navigationController: UINavigationController?
    var assemblyBuilder: BuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: BuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
   
    func popToRoot() {
        navigationController?.popViewController(animated: true)
    }

    func initalViewController() {
        if let navigationController = navigationController {
            guard let loginViewController = assemblyBuilder?.creatLoginModule(router: self) else { return }
                navigationController.viewControllers = [loginViewController]
        }
    }
    
    func showRegistration() {
        if let navigationController = navigationController {
            guard let registrationViewController = assemblyBuilder?.creatRegistrationModule(router: self) else { return }
            navigationController.pushViewController(registrationViewController, animated: true)
        }
    }
    
    func showTabBarController() {
        if let navigationController = navigationController {
            guard let customTabBarController = assemblyBuilder?.creatCustomTabBar() else { return }
            navigationController.pushViewController(customTabBarController, animated: true)
        }
    }
}
