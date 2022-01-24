//
//  TestTableViewCell.swift
//  Week4
//
//  Created by mac on 2021/02/02.
//

import UIKit

class TestTableViewCell: UITableViewCell {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(item: Book){
        titleLabel.text = item.title
        subTitleLabel.text = item.author
//        profileImageView.image = item.image
    }
    
}
