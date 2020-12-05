//
//  DetailPage.swift
//  Test
//
//  Created by Turker GUNEY on 5.12.2020.
//

import UIKit


class DetailPage:UIViewController {
    
    var coordinator:RootCoordinator!
    var loginID:String!
    
    
    private var topView = DetailTop()
    private var middleView = DetailMiddle()
    private var viewModel = DetailPageVM()
    
    
    override func viewDidLoad() {
        setViews()
        configureViews()
    }
    private func setViews(){
        self.view.addSubview(topView)
        self.view.addSubview(middleView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        middleView.translatesAutoresizingMaskIntoConstraints = false
        
        
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        middleView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        middleView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        middleView.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 20).isActive = true
        middleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    private func configureViews(){
        self.view.layoutIfNeeded()
        self.view.backgroundColor = UIColor.systemBackground
        viewModel.delegate = self
        
        viewModel.getDatail(loginID: self.loginID)
    }

}
extension DetailPage:DetailPageVMDelegate {
    func dataHasArrived(data: UserDetailModel) {
        topView.setView(data: data)
        middleView.setView(data: data)
        title = data.name
    }
}
