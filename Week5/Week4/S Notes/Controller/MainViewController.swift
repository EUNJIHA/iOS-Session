//
//  MainViewController.swift
//  Week4
//
//  Created by mac on 2021/02/03.
//

import UIKit
import Floaty

class MainViewController: BaseViewController {
    
    // Data를 직접 가져와서 사용
    var categories: [Category] = Category.list
    var selectedIndexPath: IndexPath?
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBAction func editCellAction(_ sender: Any) {
        editButton.title = mainTableView.isEditing ? "Edit" : "Done"
        mainTableView.setEditing(!mainTableView.isEditing, animated: true)
    }
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var mainTableView: UITableView!
    
    @IBAction func addFolder(_ sender: Any) {
        let alert = UIAlertController(title: "Folder name", message: "", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Entered folder name"
        }
        alert.addAction(UIAlertAction(title: "Create", style: .default) { _ in
            guard let text = alert.textFields?[0].text else { return }
            if text != "" {
                self.categories.append(Category(title: text, color: "Yellow", notes: []))
                self.mainTableView.reloadData()
            }
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = addButton.frame.width/2
        
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
            
            if let indexPath = mainTableView.indexPathForRow(at: touchPoint) {
                // 수정 창 띄워주기 Q: self.list를 가져오는게 맞지요?
                
                let alert = UIAlertController(title: "Folder name", message: "", preferredStyle: .alert)
                alert.addTextField { textField in
                    textField.text = self.categories[indexPath.row].title
                    textField.placeholder = "Entered folder name"
                }
                alert.addAction(UIAlertAction(title: "Change", style: .default) { _ in
                    guard let text = alert.textFields?[0].text else { return }
                    if !text.isEmpty {
                        self.categories[indexPath.row].title = text
                        self.mainTableView.reloadData()
                    }
                })
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as? MainTableViewCell else {
            return UITableViewCell() // 왜 이렇게 하는거죠??????
        }
        
        // MARK:- UPDATE 하는 과정?
        cell.updateUI(list: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            categories.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let targetItem: Category = self.categories[sourceIndexPath.row]
        self.categories.remove(at: sourceIndexPath.row)
        self.categories.insert(targetItem, at: destinationIndexPath.row)
    }
    
    // Cell을 눌렀다가 뗐을 때 애니메이션 (이전에는 누른 상태 그대로 였음)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "listSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let noteViewController = segue.destination as? NoteViewController,
           let indexPath = selectedIndexPath {
//            destination.listItem = list[mainTableView.indexPathForSelectedRow?.row ?? 0]
            noteViewController.listItem = categories[indexPath.row]
            noteViewController.notes = categories[indexPath.row].notes
            selectedIndexPath = nil
        } else if let addViewController = segue.destination as? AddViewController {
            addViewController.delegate = self
        }
    }
}

extension MainViewController: AddNoteItemDelegate {
    func save(_ noteItem: Note) {
        if let index = categories.firstIndex(where: { $0.title == noteItem.category }) {
            categories[index].notes.append(noteItem)
            mainTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
    }
}
