//
//  SearchTableViewCell.swift
//  Week4
//
//  Created by mac on 2021/02/05.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var folderImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func updateUI(noteItem: Note){
        titleLabel.text = noteItem.title
        timeLabel.text = noteItem.time
        categoryLabel.text = noteItem.category
        
        
        if ((noteItem.images.isEmpty) ?? false) {
            thumbnailImageView.isHidden = true
        }else {
            thumbnailImageView.image = UIImage(named: noteItem.images[0] ?? "IU")
        }
        
        var color: String!
        switch noteItem.category {
        case "All Notes":
            color = "Green"
        case "Grace":
            color = "Red"
        case "Hi":
            color = "Yellow"
        case "Key":
            color = "Orange"
        default:
            color = "Green"
        }
        folderImageView.tintColor = UIColor(named: color)

        
    }
    
}
