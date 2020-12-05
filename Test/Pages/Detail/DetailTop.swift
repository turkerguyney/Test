//
//  DetailTop.swift
//  Test
//
//  Created by Turker GUNEY on 5.12.2020.
//

import UIKit

class DetailTop:UIView {
    
    
    private var profileImageView = UIImageView()
    private var followerLabel = UILabel()
    private var followingLabel = UILabel()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews(){
        addSubview(profileImageView)
        addSubview(followerLabel)
        addSubview(followingLabel)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        followerLabel.translatesAutoresizingMaskIntoConstraints = false
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        profileImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        
        followerLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5).isActive = true
        followerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        followerLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        followerLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        followingLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        followingLabel.leftAnchor.constraint(equalTo: centerXAnchor).isActive = true
        followingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        followingLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5).isActive = true
        
        
    }
    private func configureViews(){
        
        profileImageView.clipsToBounds = true
        followingLabel.textAlignment = .center
        followerLabel.textAlignment = .center
        
    }
    func setView(data:UserDetailModel){
        let followerCount = data.followers ?? 0
        let followingCount = data.following ?? 0
        
        followerLabel.text = "followers: \(followerCount)"
        followingLabel.text = "following: \(followingCount)"
        
        if let imageUrl = data.avatar_url {
            profileImageView.downloaded(from: imageUrl, contentMode: .scaleAspectFill, isInverted: false)
        }
        
    }
    
    
}

