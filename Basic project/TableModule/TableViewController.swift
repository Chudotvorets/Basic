//
//  TableViewController.swift
//  Basic project
//
//  Created by SIMONOV on 18.06.2022.
//

import Foundation
import UIKit

class TableViewController: UIViewController {
    
    var presenter: TablePresentorProtocol
    

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Поиск изображений"
        searchBar.sizeToFit()
        searchBar.backgroundColor = .white
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        return tableView
    }()
    
    init(presentor: TablePresentorProtocol) {
        self.presenter = presentor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            presenter.view = self
            presenter.viewDidLoad()
            view.backgroundColor = .white
            configureSerachBar()
            configureTableView()
            navigationController?.navigationBar.isHidden = true
//            self.tableView.estimatedRowHeight = 44.0
//            self.tableView.rowHeight = UITableView.automaticDimension
        }
    
    //MARK: - constraints
    internal func configureSerachBar() {
        view.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview()
        }
    }
}

extension TableViewController: TableViewProtocol {
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

      //MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension

    }

}

//MARK: - UISearchBarDelegate
extension TableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.presenter.listSearch(searchText: searchText)
        }
    }
}




