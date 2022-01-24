//
//  MainTableViewCell.swift
//  Week4
//
//  Created by mac on 2021/02/03.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let identifier: String = "MainTableViewCell"

    @IBOutlet var listImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(list: Category){
        // 색깔 바꾸기
        
//        var noteList: [Note] = Note.noteList1
//        listImageView = UIImageView(image: UIImage(systemName: "folder.fill"))
//        listImageView.setImageColor(color: UIColor.purple)
        
        listImageView.tintColor = UIColor(named: list.color)
        titleLabel.text = list.title
        totalLabel.text = "(\(list.total))" // 이 부분 동적으로 어떻게 바꿀까?
        
//        let tintableImage = UIImage(named: "folder.fill")?.withRenderingMode(.alwaysTemplate)
//        tintableImage.image = tintableImage
//        tintableImage.tintColor = UIColor.red
//
//
//
//        listImageView.image = listImageView.image!.withRenderingMode(.alwaysTemplate)
//        listImageView.tintColor =
//        listImageView.tintColor = UIColor.init(cgColor: list.color)
        
//        let image = UIImage(systemName: "\(letter).square")

        

        
        
    }
}


extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
