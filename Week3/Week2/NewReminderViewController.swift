//
//  NewReminderViewController.swift
//  Week2
//
//  Created by mac on 2021/01/28.
//

import UIKit

protocol UITestDelegate {
    func sendData(data: String)
}


class NewReminderViewController: UIViewController, UITextViewDelegate{

//    let notiCenter = NotificationCenter.default

    var delegate: UITestDelegate?
    

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard (!titleTextView.text.isEmpty) else {
            return
        }
        print("ddd")
        // Item 추가
        

        let scores = ["title": titleTextView.text]

        NotificationCenter.default.post(
             name: NSNotification.Name(rawValue: "PostButton"),
             object: nil, userInfo: scores)
        
        // 뷰 사라짐
        self.dismiss(animated: true) {
            
        }
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        if let data = titleTextView.text {
            delegate?.sendData(data: data)
            dismiss(animated: true, completion: nil)
        }
        
        self.dismiss(animated: true) {
            
        }
        
    }

    
    
    @IBAction func testButtonTouchUpInside(_ sender: Any) {
        self.delegate?.sendData(data: titleTextView.text)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
//        titleTextView.delegate = self

        if titleTextView.text.isEmpty {
            addButton.isEnabled = false
        }
        


    }
    
//    func textViewDidChange(textView: UITextView) {
//        if textView == self.titleTextView {
//            self.addButton.isEnabled = !titleTextView.text.isEmpty
//        }
    }
    
    

    




//extension NewReminderViewController: UITextViewDelegate {
//
//    private func textViewDidChange(titleTextView: UITextView) {
//        if titleTextView == self.titleTextView {
//            self.addButton.isEnabled = !titleTextView.text.isEmpty
//        }
//    }
//}
