//
//  ProfileViewController.swift
//  Basic project
//
//  Created by SIMONOV on 16.06.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    var presentor: ProfilePresenterProtocol
    
    init(presentor: ProfilePresenterProtocol) {
    self.presentor = presentor
    super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .red
            
        }
}

