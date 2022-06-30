//
//  CollectionPresentor.swift
//  Basic project
//
//  Created by SIMONOV on 18.06.2022.
//

import Foundation
import UIKit

protocol CollectionViewProtocol: AnyObject {
    func configureCollectionView()
    func collectionViewReloadData()
}

protocol CollectionPresentorProtocol: AnyObject {
    var view: CollectionViewProtocol? { get set }
    func emptyModel()
    func fetchPhoto(request: String)
    func numberOfRowsInSection() -> Int
    func cellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func didSelectItemAt(indexPath: IndexPath, _ navigationController: UINavigationController)
}

class CollectionViewPresentor: CollectionPresentorProtocol {
    

    weak var view: CollectionViewProtocol?

    var service = NetworkService()

    
    
    func emptyModel() {
       // PhotoModel.results = []
    }
    
    func fetchPhoto(request: String) {
//        service.fetchPhotos(query: request, completion: {
//            self.view?.collectionViewReloadData()
        //})
            
    }
    
    
    func numberOfRowsInSection() -> Int {
       return 0//model?.results.count
    }
    
    func cellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let imageURLString = PhotoModel.results[indexPath.row].urls.regular
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        //cell.configure(with: imageURLString )
        return cell
    }
    
    func didSelectItemAt(indexPath: IndexPath, _ navigationController: UINavigationController) {
        
        }
    }

