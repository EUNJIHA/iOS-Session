//
//  FriendTableViewCell.swift
//  Week4
//
//  Created by mac on 2021/02/02.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 이건 임의로 만든 함수인거지????
    func updateUI(friend: Friend){
        nameLabel.text = friend.name
        songLabel.text = friend.song
    }
}
