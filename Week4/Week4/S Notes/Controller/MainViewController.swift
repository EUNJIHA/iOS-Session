//
//  MainViewController.swift
//  Week4
//
//  Created by mac on 2021/02/03.
//

import UIKit

class MainViewController: UIViewController {
    
    // Data를 직접 가져와서 사용
    var list: [List] = List.list
//    var numbers = [Int](0..<list.count)
    

    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBAction func editCellAction(_ sender: Any) {
        if self.mainTableView.isEditing {
            self.editButton.title = "Edit"
            self.mainTableView.setEditing(false, animated: true)
        } else {
            self.editButton.title = "Done"
            self.mainTableView.setEditing(true, animated: true)
        }
    }
    
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var mainTableView: UITableView!

    @IBAction func addFolder(_ sender: Any) {
        let alert = UIAlertController(title: "Folder name", message: "", preferredStyle: .alert)
                alert.addTextField { textField in
                    textField.placeholder = "Entered folder name"
                }
                alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { _ in
                    guard let text = alert.textFields?[0].text else { return }
                    if text != "" {
                        self.list.append(List(title: text , total:"0", color: "Yellow"))
                        self.mainTableView.reloadData()
//                        self.scrollToBottom()
                    }
                }))
        
        
//                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
//                    self.navigationController?.popViewController(animated: true)
//
//                }))
        
        
        
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tabBarController?.tabBar.isHidden = false

        
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = addButton.frame.width/2
        
        // Constraint 주고 싶은데, 현재 Storyboard 상에서는 Button -> Safe Area / View와 Constraint를 줄 수 없게 되어 있음;
        // let addButton = UIView()
        // addButton.backgroundColor = UIColor.red
        // view.addSubview(addButton)

//        addButton.translatesAutoresizingMaskIntoConstraints = false
//        let horizontalConstraint = NSLayoutConstraint(item: addButton, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -20)
//        
//        let verticalConstraint = NSLayoutConstraint(item: addButton, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -100)
//        
//        let widthConstraint = NSLayoutConstraint(item: addButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
//        let heightConstraint = NSLayoutConstraint(item: addButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
//        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        let mainListCell = UINib(nibName: "MainTableViewCell", bundle: Bundle.main)
        mainTableView.register(mainListCell, forCellReuseIdentifier: "MainTableViewCell")
        
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MainViewController.handleLongPress))
        mainTableView.addGestureRecognizer(longPress)
        
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer){
        if sender.state == UIGestureRecognizer.State.began {
            let touchPoint = sender.location(in: mainTableView)
            
//            print(touchPoint)
            if let indexPath = mainTableView.indexPathForRow(at: touchPoint) {
                // your code here, get the row for the indexPath or do whatever you want
                print("YES\(indexPath.row)")
                print(list[indexPath.row])
                
                
                // 수정 창 띄워주기 Q: self.list를 가져오는게 맞지요?
                
                let alert = UIAlertController(title: "Folder name", message: "", preferredStyle: .alert)
                        alert.addTextField { textField in
                            textField.text = self.list[indexPath.row].title
                            textField.placeholder = "Entered folder name"
                        }
                        alert.addAction(UIAlertAction(title: "Change", style: .default, handler: { _ in
                            guard let text = alert.textFields?[0].text else { return }
                            if text != "" {
//                                self.list.append(List(title: text , total:"0", color: "Yellow"))
                                self.list[indexPath.row].title = text
                                self.mainTableView.reloadData()
                            }
                        }))

                
                
                
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
            }
        }
    }
//    func setupView() {
//        addButton.translatesAutoresizingMaskIntoConstraints = false
////        addButton.backgroundColor = .green
//        view.addSubview(addButton)
//
//        let margins = view.layoutMarginsGuide
//        NSLayoutConstraint.activate([
//            addButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            addButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
//        ])
//        if #available(iOS 11, *) {
//            let guide = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                addButton.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
//                guide.bottomAnchor.constraint(equalToSystemSpacingBelow: addButton.bottomAnchor, multiplier: 1.0)
//            ])
//        } else {
//            let standardSpacing: CGFloat = 8.0
//            NSLayoutConstraint.activate([
//                addButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
//                bottomLayoutGuide.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: standardSpacing)
//            ])
//        }
//    }
 }

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as? MainTableViewCell else {
            return UITableViewCell() // 왜 이렇게 하는거죠??????
        }
        
        // MARK:- UPDATE 하는 과정?
        print(list[indexPath.row])
        cell.updateUI(list: list[indexPath.row])
        return cell;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        print("\(self.itemName) from: \(sourceIndexPath.row) -> to: \(destinationIndexPath.row)")
        let targetItem: List = self.list[sourceIndexPath.row]
        self.list.remove(at: sourceIndexPath.row)
        self.list.insert(targetItem, at: destinationIndexPath.row)
    }
    
    // Edit - 셀 이동하기
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//          print("moveRowAt called from \(sourceIndexPath) to \(destinationIndexPath)")
//      }
    
    // Cell을 눌렀다가 뗐을 때 애니메이션 (이전에는 누른 상태 그대로 였음)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
        performSegue(withIdentifier: "listSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NoteViewController {
            destination.listItem = list[mainTableView.indexPathForSelectedRow?.row ?? 0]
            
            // Question) deselectRow 애니메이션을 위해 다음과 같이 작성했는데, !를 사용할 수 밖에 없는 것인가?
            mainTableView.deselectRow(at: mainTableView.indexPathForSelectedRow!, animated: true)

//            self.hidesBottomBarWhenPushed = true

        }
    }
    
    
}



