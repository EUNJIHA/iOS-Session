//
//  NoteDetailViewController.swift
//  Week4
//
//  Created by mac on 2021/02/04.
//

import UIKit

class NoteDetailViewController : UIViewController {
    
//    var noteVC = NoteViewController()
    var noteItem: Note?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        titleTextField.isUserInteractionEnabled = false
        contentTextView.isUserInteractionEnabled = false

//        NoteViewController.delegate = self

        guard let noteItem = noteItem else {
            return
        }
        self.navigationItem.title = noteItem.time
        titleTextField.text = noteItem.title
        contentTextView.text = noteItem.content
        
        if ((noteItem.image?.isEmpty) ?? false) {
            mainImageView.isHidden = true
        }else {
            mainImageView.image = UIImage(named: noteItem.image?[0] ?? "IU")
        }

    }
    
    
    
    // 수정하기
}


extension NoteDetailViewController: NoteItemDelegate {
    func send(noteItem: Note) {
//        print("he\(noteItem)")
        self.noteItem = noteItem
        
        
        
    }
    
}

// 뭐가 있을까?
