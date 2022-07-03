//
//  CollectionViewController.swift
//  Basic project
//
//  Created by SIMONOV on 18.06.2022.
//

import Foundation
import UIKit
import SnapKit

final class CollectionViewController: UIViewController {
   
    var presentor: CollectionPresentorProtocol
    
    
    private lazy var imageCollectionView: UICollectionView = {
        let layoutImage = UICollectionViewFlowLayout()
        layoutImage.scrollDirection = .vertical
       
        layoutImage.itemSize = CGSize(width: view.frame.size.width/2.1, height: view.frame.size.height/4)
        
        let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutImage)
        imageCollectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: FavoritesCollectionViewCell.identifier)
        imageCollectionView.dataSource = self
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
        presentor.viewDidLoad()
        configureCollectionView()
        view.backgroundColor = .white
       
        
    }
    
    //MARK: - constraints
    
    private func configureCollectionView() {
        view.addSubview(imageCollectionView)
        imageCollectionView.dataSource = self
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionViewReloadData()
        presentor.configureModel()
    }
}
    
   //MARK: - Extensions

    extension CollectionViewController: CollectionViewProtocol {
        
        func collectionViewReloadData() {
            DispatchQueue.main.async {
                self.imageCollectionView.reloadData()
            }
        }
    }

    extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            presentor.numberOfRowsInSection()
        }
    
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            presentor.cellForItemAt(collectionView, cellForItemAt: indexPath)
            
        }
    }


