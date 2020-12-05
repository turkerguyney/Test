//
//  CellProtocol.swift
//  Test
//
//  Created by Turker GUNEY on 3.12.2020.
//

import UIKit

protocol CellProtocol:UITableViewCell {
    
    static var identifier:String {set get}
    
    var profileImageView:UIImageView {set get}
    var nameLabel:UILabel {set get}
    var detailsLabel:UILabel {set get}
    func setViews()
    func configureViews()
    func setCell(data:Any)
    
    
}
extension CellProtocol {
    func setViews(){
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailsLabel)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 5).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor,constant: 5).isActive = true
        nameLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor,constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: detailsLabel.topAnchor).isActive = true
        
        detailsLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor,constant: 5).isActive = true
        detailsLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor,constant: 5).isActive = true
        detailsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        detailsLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true

    }
    func configureViews(){
        profileImageView.layer.cornerRadius = 25
        profileImageView.clipsToBounds = true
        profileImageView.image = UIImage(named: "defaulimage")
    }
}
