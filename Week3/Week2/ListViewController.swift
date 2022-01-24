//
//  ListViewController.swift
//  Week2
//
//  Created by mac on 2021/01/29.
//

import UIKit

let myNoti = Notification.Name.init("myNoti") // 외부에서 접근 가능하도록 하기위해 클래스 위에 선언한것.

struct Reminders : Codable {
    var title: String
    var notes: String
    // var url: String?
}
var defaultReminders : [Reminders] = [
    Reminders(title: "Title 11", notes: "Notes 11"),
    Reminders(title: "Title 22", notes: "Notes 22"),
    Reminders(title: "Title 33", notes: "Notes 33"),
]

//UserDefaults.standard.set(try? PropertyListEncoder().encode(reminders), forKey:"reminders")
//
//if let data = UserDefaults.standard.value(forKey:"reminders") as? Data {
//    let storedReminders = try? PropertyListDecoder().decode(Array<Reminders>.self, from: data)
//}


//var reminders : [Reminders]?
// 이것들 UserDefaults에서 가져오기?



class ListViewController: UIViewController {
    
    
    @IBOutlet weak var largeTitleLabel: UILabel!
    
    @IBOutlet weak var title1TextView: UITextView!
    @IBOutlet weak var notes1TextView: UITextView!
    
    @IBOutlet weak var title2TextView: UITextView!
    @IBOutlet weak var notes2TextView: UITextView!
    
    @IBOutlet weak var title3TextView: UITextView!
    @IBOutlet weak var notes3TextView: UITextView!
    
    
    @objc func showLabel(_ notification: Notification){
        
        print("대성공")
        if let data = notification.userInfo as? [String: Int]
        {
            for (name, score) in data
            {
                print("\(name) scored \(score) points!")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(showLabel),
            name: NSNotification.Name(rawValue: "PostButton"),
            object: nil)

//    @objc func showLabel(){
//        print("성공함!")
//    }
//    
//    override func viewDidLoad() {
//        
//        NotificationCenter.default.addObserver(self,
//            selector: #selector(showLabel),
//            name: NSNotification.Name(rawValue: "PostButton"),
//            object: nil)
        

//        NotificationCenter.default.addObserver(self, selector: #selector(handleNoti(_:)), name: myNoti, object: nil)

        
//        var reminders: [Reminders]?
//
//        // UserDefaults에 저장된 데이터 있을 시에
//        if let data = UserDefaults.standard.value(forKey:"reminders") as? Data {
//            reminders = try? PropertyListDecoder().decode(Array<Reminders>.self, from: data)
//        }else { // 없을 시에 기본 값으로 초기화
//            reminders = defaultReminders
//        }
                
//        reminders?.forEach {
//            print("\($0.value) is from \($0.key)")
//        }
//        for (index, reminder) in reminders?.enumerated() {
//
//
//            print("\(index + 1). \(ship.value) is from \(ship.key)")
//        }
        
        
        print("안녕 \(String(describing: title1TextView.text))")
        // self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //myNoti라 Name이라는 것을 받으면 작동하는 메서드
     @objc func handleNoti(_ noti: Notification) {
         print(noti)
         print("handleNoti")
     }
    
    // 1. Storyboard Segue
    // 첫 번째 Item - Stroyboard의 Segue 이용하기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "firstSegue":
            
            print("firstSegue")
            
            // DetailVC에 데이터 넘기기
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.listVC = self
                detailVC.itemTitle = title1TextView.text
                print(title1TextView.text ?? "sdsds")
                detailVC.itemNotes = notes1TextView.text
            }
        
        default:
            break
        }
    }
    
    
    // 2. 직접 할당
    // 두 번째 Item - Storyboard VC의 Identifier로 직접 할당
    @IBAction func item2EditButtonTapped(_ sender: Any) {
        if let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            
            // 화면 전환
            // self.navigationController?.pushViewController(detailVC, animated: true)
            
            detailVC.modalTransitionStyle = .coverVertical
            print("들어옴")
            detailVC.listVC = self
            detailVC.itemTitle = title2TextView.text
            detailVC.itemNotes = notes2TextView.text
            
            // 관리를 위한 값
            detailVC.status = "SECOND"
            self.present(detailVC, animated: true, completion: nil)

        }
    }
    
    
    // 3. UserDefaults
    
    override func viewWillDisappear(_ animated: Bool) {
        // UserDefaults에 3번째 값 항목 저장
        UserDefaults.standard.set(title3TextView.text, forKey: "Title")
        UserDefaults.standard.set(notes3TextView.text, forKey: "Notes")


    }
    

    // 세 번째 Item - UserDefaults에 저장된 값에 기반
    override func viewDidAppear(_ animated: Bool) {

        if let title = UserDefaults.standard.value(forKey: "Title") {
            title3TextView.text = title as! String
        }
        
        if let notes = UserDefaults.standard.value(forKey: "Notes") {
            notes3TextView.text = notes as! String
        }
//        title3TextView.text = UserDefaults.standard.value(forKey: "Title") // Load
//        notes3TextView.text = UserDefaults.standard.value(forKey: "Notes") // Load

    }


    
    // 4. NotificationCenter
    
    
    
    // 5. Protocol(Delegate)
}
