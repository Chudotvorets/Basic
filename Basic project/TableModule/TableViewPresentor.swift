//
//  TablePresentor.swift
//  Basic project
//
//  Created by SIMONOV on 18.06.2022.
//

import Foundation
import UIKit
import Kingfisher

protocol TableViewProtocol: AnyObject {
    func reloadData()
    func configureTableView()
}

protocol TablePresentorProtocol: AnyObject {
    var view: TableViewProtocol? { get set }
    func listSearch(searchText: String)
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    //func configureCell() -> CollectionModel
}


    class TableViewPresentor: TablePresentorProtocol {
        
    private var model: [Result] = []
    weak var view: TableViewProtocol?
    private var service = NetworkService()
    private var isSearching = false
        
        func viewDidLoad() {
            fetchData()
        }

        func numberOfRowsInSection() -> Int {
            if isSearching {
                return model.count
            } else {
                return model.count
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageTableViewCell", for: indexPath) as! TableViewCell
       // cell.delegate = self
        cell.photoImageView.kf.setImage(with: URL(string: model[indexPath.row].urls?.regular ?? ""), placeholder: nil)
        
        cell.firstName.text = model[indexPath.row].user.firstName ?? ""
        cell.lastName.text = model[indexPath.row].user.lastName ?? ""
                                        
        return cell
      
    }
        private func fetchData() {
            service.fetchPhotos({ [weak self] profiles in
                guard let self = self else { return }
                self.model = profiles
                self.view?.reloadData()
            })
        }
        func listSearch(searchText: String) {
            self.model.removeAll()
            guard searchText.isEmpty || searchText != " " else {
                print("empty search")
                return
            }
            
            for item in model {
                let text = searchText.lowercased()
                let firstNameInArray = item.user.firstName?.lowercased().range(of: text)
                let lastNameInArray = item.user.lastName?.lowercased().range(of: text)
                if firstNameInArray != nil || lastNameInArray != nil {
                    print("Search complete")
                    self.model.append(item)
                }
            }
           
            if searchText == "" {
                isSearching = false
                view?.reloadData()
            } else {
                isSearching = true
                view?.reloadData()
            }
        }
}
        

