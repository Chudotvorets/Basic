//
//  ViewController.swift
//  Basic project
//
//  Created by SIMONOV on 14.06.2022.
//

import UIKit
import SnapKit

class WelcomeScreenViewController: UIViewController {
    
    //MARK: - property
    
    var welcomeImage: UIImageView = {
        let welcomeImage = UIImageView()
        welcomeImage.image = UIImage(named: "welcome")
        welcomeImage.contentMode = .scaleAspectFit
        return welcomeImage
    }()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        installationImage()
    }
    //MARK: - func

    private func installationImage() {
        view.backgroundColor = .white
        view.addSubview(welcomeImage)
        welcomeImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
}

