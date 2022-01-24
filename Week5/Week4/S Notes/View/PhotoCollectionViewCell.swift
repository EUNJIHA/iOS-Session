//
//  PhotoCollectionViewCell.swift
//  Week4
//
//  Created by mac on 2021/02/19.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(photo: Photo){
        let url = URL(string: photo.url)
//        let url = URL(string: "https://www.10wallpaper.com/wallpaper/1366x768/1401/mountains_reflection-Nature_Desktop_Wallpaper_1366x768.jpg")
        iconImageView.kf.setImage(with: url)
        titleLabel.text = photo.title
        
//        let url = URL(string: photo.url)
//        let data = try Data(contentsOf: url!)
//        iconImageView.image = UIImage(named: "IU")
        
        
//        iconImageView.image = UIImage(named: photo.url)

    }

}
