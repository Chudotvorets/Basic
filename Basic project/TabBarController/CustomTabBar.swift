//
//  CustomTabBar.swift
//  Basic project
//
//  Created by SIMONOV on 20.06.2022.
//


import UIKit

class CustomTabBar: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTabBar()
       
    }
    
    private func settingTabBar() {
        tabBar.backgroundColor = .white
        
        let tableViewController = TableViewPresentor()
        let tableViewNavigationController = UINavigationController(rootViewController: TableViewController(presentor: tableViewController))
        
        let collectionViewPresentor = CollectionViewPresentor()
        let collectionViewNavigationController = UINavigationController(rootViewController: CollectionViewController(presentor: collectionViewPresentor))
        
        
        viewControllers = [tableViewNavigationController, collectionViewNavigationController]
        
        tableViewNavigationController.tabBarItem = UITabBarItem.init(title: "Photo", image: .init(systemName: "photo"), tag: 0)
        collectionViewNavigationController.tabBarItem = UITabBarItem.init(title: "Favorites", image: .init(systemName: "star"), tag: 1)
        
    }
}
