//
//  NoteDetailViewController.swift
//  Week4
//
//  Created by mac on 2021/02/04.
//

import UIKit

class NoteDetailViewController : UIViewController {
    
    var noteItem: Note!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = noteItem.time
        
        titleTextField.text = noteItem.title
        contentTextView.text = noteItem.content
        
        if let image = noteItem.images.first {
            mainImageView.image = UIImage(named: image)
        } else {
            mainImageView.isHidden = true
        }
    }
}


extension NoteDetailViewController: NoteItemDelegate {
    func send(noteItem: Note) {
        self.noteItem = noteItem
    }
    
}
