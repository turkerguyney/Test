//
//  MainPageVM.swift
//  Test
//
//  Created by Turker GUNEY on 3.12.2020.
//

import UIKit

protocol MainPageVMDelegate:NSObject {
    func dataChanged()
    func gotoDetail(of:String)
}

class MainPageVM:NSObject {
    
    weak var delegate:MainPageVMDelegate?
    
    private var waitsForResponse = false
   
    
    private var allUsers = [UserModel](){
        didSet {
            filteredUsers = allUsers
        }
    }
    private var filteredUsers = [UserModel]() {
        didSet {
            delegate?.dataChanged()
        }
    }
    
    func getUserList(since:Int){
        
        guard let url = URL(string: "https://api.github.com/users?since=\(since)") else {return}
        
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, response, error -> Void in
            self?.waitsForResponse = false
            guard let data = data else {return}
            do {
                if let decodedData = try? JSONDecoder().decode([UserModel].self, from: data){
                    
                    DispatchQueue.main.async {
                        self?.allUsers.append(contentsOf: decodedData)
                    }
                }

            }
            
        })
        task.resume()
        
    }
    
}
extension MainPageVM:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellData = filteredUsers[indexPath.row]
        
        if indexPath.row == allUsers.count - 1 {
            getUserList(since: cellData.id)
        }
        
        var cell:CellProtocol
        
        if ((indexPath.row + 1) % 4) == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: InvertedCell.identifier, for: indexPath) as! CellProtocol
        }else if cellData.site_admin{
            cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.identifier, for: indexPath) as! CellProtocol
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: NormalCell.identifier, for: indexPath) as! CellProtocol
        }
        
        cell.setCell(data: cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = filteredUsers[indexPath.row].login
        delegate?.gotoDetail(of: id)
    }
    
    
}
extension MainPageVM:UISearchBarDelegate {
    private func startSearch(term:String){
        guard !term.isEmpty else {
            filteredUsers = allUsers;
            delegate?.dataChanged()
            
            return
        }
        filteredUsers = allUsers.filter({ (model) -> Bool in
            
            return model.login.lowercased().contains(term.lowercased())
        })
        delegate?.dataChanged()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        startSearch(term: searchBar.text ?? "")
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        startSearch(term: searchBar.text ?? "")
    }
}


