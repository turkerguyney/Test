//
//  DetailPageVM.swift
//  Test
//
//  Created by Turker GUNEY on 5.12.2020.
//

import Foundation

protocol DetailPageVMDelegate:NSObject {
    func dataHasArrived(data:UserDetailModel)
}

class DetailPageVM {
   
    weak var delegate:DetailPageVMDelegate?
    
    func getDatail(loginID:String){
        
        guard let url = URL(string: "https://api.github.com/users/\(loginID)") else {return}
        
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, response, error -> Void in
           
            guard let data = data else {return}
            do {
                if let decodedData = try? JSONDecoder().decode(UserDetailModel.self, from: data){
                    
                    DispatchQueue.main.async {
                        self?.delegate?.dataHasArrived(data: decodedData)
                    }
                }

            }
            
        })
        task.resume()
        
    }
    
}
