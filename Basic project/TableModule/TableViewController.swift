//
//  TableViewController.swift
//  Basic project
//
//  Created by SIMONOV on 18.06.2022.
//

import Foundation
import UIKit

class TableViewCotroller: UIViewController {
    
    var presentor: TablePresentorProtocol
    
    init(presentor: TablePresentorProtocol) {
        self.presentor = presentor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .green
    }
}
