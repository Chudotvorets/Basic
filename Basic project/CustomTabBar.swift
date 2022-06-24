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
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .white
        super.viewWillAppear(animated)
    }
    
    private func settingTabBar() {
        tabBar.backgroundColor = .white
        
        
        let collectionViewPresentor = CollectionViewPresentor()
        let collectionViewNavigationController = UINavigationController(rootViewController: CollectionViewController(presentor: collectionViewPresentor))
        
        let tableViewController = TableViewPresentor()
        let tableViewNavigationController = UINavigationController(rootViewController: TableViewCotroller(presentor: tableViewController))
        
        let profileViewPresentor = ProfileViewPresentor()
        let profileViewNavigationController = UINavigationController(rootViewController: ProfileViewController(presentor: profileViewPresentor))
        
        viewControllers = [collectionViewNavigationController, tableViewNavigationController, profileViewNavigationController]
        
        collectionViewNavigationController.tabBarItem = UITabBarItem.init(title: "Collection", image: .init(systemName: "tablecells"), tag: 0)
        tableViewNavigationController.tabBarItem = UITabBarItem.init(title: "Table", image: .init(systemName: "doc.plaintext"), tag: 1)
        profileViewNavigationController.tabBarItem = UITabBarItem.init(title: "Profile", image: .init(systemName: "person.crop.circle.fill"), tag: 2)
    }
}
