//
//  DetailViewController.swift
//  Week2
//
//  Created by mac on 2021/01/29.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var urlTextView: UITextView!

    var listVC: ListViewController?
    var itemTitle: String?
    var itemNotes: String?
    var itemUrl: String?
    
    var status: String?
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {

        guard titleTextView.text != nil && titleTextView.text != "" else {
            return
        }
        
        // 테스트를 위한 정리 안 된 코드
        if status == "SECOND" {
            listVC?.title2TextView.text = titleTextView.text
            listVC?.notes2TextView.text = notesTextView.text
        }else{
            listVC?.title1TextView.text = titleTextView.text
            listVC?.notes1TextView.text = notesTextView.text
        }
        

        
        self.dismiss(animated: true) {
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        print(itemTitle ?? "dsdksld")
        
        titleTextView.text = itemTitle
        notesTextView.text = itemNotes
        
    }

}
