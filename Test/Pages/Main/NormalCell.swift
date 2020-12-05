//
//  MainPageCell.swift
//  Test
//
//  Created by Turker GUNEY on 3.12.2020.
//

import UIKit

class NormalCell: UITableViewCell,CellProtocol {
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static var identifier = "NormalCellID"
    
    var profileImageView = UIImageView()
    var nameLabel = UILabel()
    var detailsLabel = UILabel()
    
    
    func setCell(data: Any) {
        guard let data = data as? UserModel else {
            return
        }
        
        nameLabel.text = data.login
        detailsLabel.text = "\(data.id)"
        if let imageUrl = data.avatar_url {
            profileImageView.downloaded(from: imageUrl, contentMode: .scaleAspectFill, isInverted: false)
        }
        
    }
    
    
}


var imageCache = [String:UIImage]()

extension UIImageView {
    
    
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill,isInverted:Bool) {
        
        if let chachedImage = imageCache[url.absoluteString] {
            self.image = chachedImage;
            return
        }
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                var image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                if isInverted {
                    image = self?.invertImage(sourceImage: image) ?? image
                }
                imageCache[url.absoluteString] = image
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit,isInverted:Bool) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode,isInverted: isInverted)
    }
    func invertImage(sourceImage:UIImage)->UIImage{
        let rawImage = CIImage(image: sourceImage)
        if let filter = CIFilter(name: "CIColorInvert") {
            filter.setValue(rawImage, forKey: kCIInputImageKey)
            let newImage = UIImage(ciImage: filter.outputImage!)
            return newImage
        }else{
            return sourceImage
        }
    }
}
