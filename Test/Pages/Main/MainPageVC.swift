//
//  MainPage.swift
//  Test
//
//  Created by Turker GUNEY on 3.12.2020.
//

import UIKit

class MainPageVC:UIViewController {
    
    var coordinator:RootCoordinator!
    
    var viewModel = MainPageVM()
    
    var searchBar = UISearchBar()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        setViews()
        configureViews()
    }
    private func setViews(){
        self.view.addSubview(searchBar)
        self.view.addSubview(tableView)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    private func configureViews(){
        self.view.backgroundColor = UIColor.systemBackground
        self.tableView.register(NormalCell.self, forCellReuseIdentifier: NormalCell.identifier)
        self.tableView.register(InvertedCell.self, forCellReuseIdentifier: InvertedCell.identifier)
        self.tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.identifier)
        
        viewModel.delegate = self
        self.tableView.dataSource = viewModel
        self.tableView.delegate = viewModel
        
        viewModel.getUserList(since: 0)
        searchBar.delegate = viewModel
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        navigationController?.navigationBar.addGestureRecognizer(tap)
    }
    
}
extension MainPageVC:MainPageVMDelegate {
    func gotoDetail(of: String) {
        coordinator.pushDetailPage(loginID: of)
    }
    
    func dataChanged() {
        self.tableView.reloadData()
    }
    
    
}
