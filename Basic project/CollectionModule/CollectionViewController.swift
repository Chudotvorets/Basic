//
//  CollectionViewController.swift
//  Basic project
//
//  Created by SIMONOV on 18.06.2022.
//

import Foundation
import UIKit
import SnapKit

final class CollectionViewController: UIViewController, CollectionViewProtocol {
   
    var presentor: CollectionPresentorProtocol
    
    
    private lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/1.1, height: view.frame.size.height/5)
        
        let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        imageCollectionView.backgroundColor = .systemBackground
        return imageCollectionView
    }()
    
    init(presentor: CollectionPresentorProtocol) {
        self.presentor = presentor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        presentor.view = self
        configureCollectionView()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
    }
    
    //MARK: - constraints
    
    internal func configureCollectionView() {
        view.addSubview(imageCollectionView)
        imageCollectionView.dataSource = self
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    
    //MARK: - method
    
    internal func collectionViewReloadData() {
        imageCollectionView.reloadData()
    }
    
}
    
   //MARK: - Extensions

    extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            presentor.numberOfRowsInSection()
        }
    
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            presentor.cellForItemAt(collectionView, cellForItemAt: indexPath)
            
        }
    }


