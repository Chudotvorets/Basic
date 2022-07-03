//
//  TableViewController.swift
//  Basic project
//
//  Created by SIMONOV on 18.06.2022.
//

import Foundation
import UIKit
import SnapKit

class TableViewController: UIViewController {
    
    var presenter: TablePresentorProtocol
    
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
            setupSearchController()
            presenter.viewDidLoad()
            view.backgroundColor = .white
            settingTableView()
            view.layoutSubviews()
        }
    
     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         tableViewReloadData()
    }
    
    //MARK: - constraints
    
    private func settingTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.isActive = true
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
    }
}

extension TableViewController: TableViewProtocol {
    
    
    func tableViewReloadData() {
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
    
}

//MARK: - UISearchBarDelegate
extension TableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.presenter.search(searchText: searchText)
        }
    }
}




