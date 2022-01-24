//
//  ListTableViewCell.swift
//  Week4
//
//  Created by mac on 2021/02/04.
//

// Cell의 image를 누르면, 제일 마지막 이미지를 보여주는 예제

import UIKit

protocol NoteCellDelegate {
    // 네이밍 -> <이미지가 눌렸다> ~ 그리고 그 내부에 어떤 일이 일어날지는 나중에 상세 구현
    func imageTapped(noteItem: Note)
}

// Question: Accessory 코드로 만들 수 있겠지?
class NoteTableViewCell: UITableViewCell {

    
    var delegate: NoteCellDelegate?
    
    var noteItem: Note?
    // Label, ImageView에도 눌렀을 때
    // Gesture - tab, swipe, ...
    // ImageView -> tab
    // Selector 자주 만남 - 함수
    // isUserInterface
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var thumbnail: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        UITapGestureRecognizer(target: self, action: #selector(thumbnailTapped))
        
        // MARK:- CELL
        thumbnail.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(thumbnailTapped)))
        thumbnail.isUserInteractionEnabled = true
        

        
        //
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(noteItem: Note, delegate: NoteCellDelegate){
        titleLabel.text = noteItem.title
        timeLabel.text = noteItem.time
        
        if ((noteItem.image?.isEmpty) ?? false) {
//            print(noteItem.image?[0])
            thumbnail.isHidden = true


//            thumbnail.image = UIImage(named: noteItem.image?[0] ?? "")
        }else {
//            print()
            thumbnail.image = UIImage(named: noteItem.image?[0] ?? "IU")

        }
        
        self.noteItem = noteItem
        
        
        // MARK:- TEST
        self.delegate = delegate
        
    }
    
    // MARK:- CELL
    @objc func thumbnailTapped() {
        if let noteItem = noteItem {
            delegate?.imageTapped(noteItem: noteItem)
        }
//        print("test")
    }
    
}
