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
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var category: UILabel!
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
        category.text = noteItem.category
        
        
        if ((noteItem.image?.isEmpty) ?? false) {
            thumbnail.isHidden = true
        }else {
            thumbnail.image = UIImage(named: noteItem.image?[0] ?? "IU")
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
