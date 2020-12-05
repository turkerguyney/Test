//
//  DetailMiddle.swift
//  Test
//
//  Created by Turker GUNEY on 5.12.2020.
//

import UIKit


class DetailMiddle:UIStackView {
    
    private var nameLabel = UILabel()
    private var companyLabel = UILabel()
    private var blogLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        configureViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews(){
        
        addArrangedSubview(nameLabel)
        addArrangedSubview(companyLabel)
        addArrangedSubview(blogLabel)
        
        
    }
    private func configureViews(){
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray.cgColor
        
        axis = .vertical
        distribution = .fillEqually
        
        layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        isLayoutMarginsRelativeArrangement = true
        
    }
    func setView(data:UserDetailModel){
        nameLabel.text = "name: \(data.name ?? "")"
        companyLabel.text = "company: \(data.company ?? "")"
        blogLabel.text = "blog: \(data.blog ?? "")"
        
    }
    
    
}
