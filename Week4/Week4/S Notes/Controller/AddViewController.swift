import UIKit

protocol AddNoteItemDelegate {
    func send(_ noteItem: Note)
}

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    
    
    var delegate: AddNoteItemDelegate?
    
    @IBAction func addItemButton(_ sender: Any) {
        guard let time = self.navigationItem.title else {
            print("NO!!!")
            return
        }
        
        // image는 우선 임의로 akmu
        let noteItem = Note(category: "All Notes", title: titleTextField.text, time: time, content: contentTextView.text, image: ["akmu"] )
        
        // Item을 리턴해서 저장 - Delegate 사용해보자.
//        delegate?.send(noteItem)
        
        // 그냥 Note.swift Array 에 추가: 흠...
        Note.noteList1.append(noteItem)
        
        // 한 단계 전으로
        self.navigationController?.popViewController(animated: true)

        
    }
    
    // 현재 시간을 계산하기 위한 부분
    let timestamp = Date().currentTimeMillis()

    func generateCurrentTimeStamp () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy hh:mm"
        return (formatter.string(from: Date()) as NSString) as String
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 현재 시각으로 설정
        self.navigationItem.title = generateCurrentTimeStamp()



        // TextView의 Placeholder를 위한 부분
        contentTextView.delegate = self
        contentTextView.text = "Please enter text"
        contentTextView.textColor = UIColor.lightGray
            
            
//        titleTextView.textContainer.maximumNumberOfLines = 10
//        titleTextView.textContainer.lineBreakMode = .byTruncatingTail
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    @objc func keyboardWillShow(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0{
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }

    }

    @objc func keyboardWillHide(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0 {
//                self.view.frame.origin.y += keyboardSize.height
//            }
//        }
    }
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}


extension AddViewController: UITextViewDelegate{

    
    
    // TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Please enter text"
            textView.textColor = UIColor.lightGray
        }
    }
    
}

extension AddViewController: UIPopoverPresentationControllerDelegate {
    
}


//    func textViewDidBeginEditing(_ textView: UITextView) {
//        textViewSetupView()
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text == "" {
//            textViewSetupView()
//
//        }
//    }
//
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.resignFirstResponder()
//        }
//
//        return true
//    }
//
//
//    func textViewSetupView() {
//        if titleTextView.text == "Title" {
//            titleTextView.text = ""
//            titleTextView.textColor = UIColor.black
//        } else if titleTextView.text == "" {
//            titleTextView.text = "Title"
//            titleTextView.textColor = UIColor.lightGray
//
//        }
//
//    }




//    @IBOutlet weak var button: UIButton!
//    @IBOutlet weak var textField: UITextField!
//    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!
//
//    var keyboardHeight: CGFloat = 0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        textField.isHidden = true
//        textField.delegate = self
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//    }
//
//    @objc func buttonPressed() {
//        textField.becomeFirstResponder()
//    }
//
//    @objc func keyboardWillShow(_ notification: Notification) {
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardHeight = keyboardFrame.cgRectValue.height
//            self.keyboardHeight = keyboardHeight
//        }
//    }
//}
//
//extension ViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        textField.isHidden = false
//        textFieldBottomConstraint.constant = keyboardHeight
//        return true
//    }
