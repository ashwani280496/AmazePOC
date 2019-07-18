//
//  washCell.swift
//  AmazePOC
//
//  Created by Ashwani Kumar on 17/07/19.
//  Copyright © 2019 Djubo. All rights reserved.
//

import UIKit

class washCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var washType: UILabel!
    @IBOutlet var mainView: UIView!
    
    var imageUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageUrl = nil
        imageView.layer.cornerRadius = 8
        mainView.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        // Initialization code
    }
    
    override func prepareForReuse() {
    }
    
    func setupImage() {
        if let url = imageUrl{
            imageView.loadImageFromUrl(url: url)
        }
    }
}


extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
    }
}

// image view extension to set image from String url to imageview
extension UIImageView{
    func loadImageFromUrl(url: String) {
        let url = URL.init(string: url)!
        URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error) in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.global(qos: .background).async {
                // Background Thread
                DispatchQueue.main.async {
                    // Run UI Updates or call completion block
                    self.image = UIImage.init(data: data!)
                }
            }
        }).resume()
    }
}
