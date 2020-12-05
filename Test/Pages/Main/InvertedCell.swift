//
//  InvertedCell.swift
//  Test
//
//  Created by Turker GUNEY on 5.12.2020.
//

import UIKit

class InvertedCell: UITableViewCell,CellProtocol {

    static var identifier = "InvertedCellID"
    
    var profileImageView = UIImageView()
    var nameLabel = UILabel()
    var detailsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(data: Any) {
        guard let data = data as? UserModel else {
            return
        }
        
        nameLabel.text = data.login
        detailsLabel.text = "\(data.id)"
        if let imageUrl = data.avatar_url {
            profileImageView.downloaded(from: imageUrl, contentMode: .scaleAspectFill, isInverted: true)
        }
        
    }
}
