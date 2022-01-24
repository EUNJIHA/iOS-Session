//
//  ListNavigationViewController.swift
//  Week4
//
//  Created by mac on 2021/02/04.
//

import UIKit

// MARK:- Delegate
protocol NoteItemDelegate {
    func send(noteItem: Note)
}

// cell 내부에 delegate
class NoteViewController: BaseViewController {
    
    var listItem: Category!
    var notes: [Note]!
    
    var selectedIndexPath: IndexPath?
    
    @IBOutlet var testImageView: UIImageView!
    
    // 현재는 segue로 구현되어 있는데 -> Delegate 등으로 바꿔 볼까요.
    @IBOutlet var addButton: UIButton!
    @IBOutlet var noteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title 받아오기
        self.navigationItem.title = listItem.title
        
        // Button 동그랗게 만들기
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = addButton.frame.width/2
        
        
        noteTableView.delegate = self
        noteTableView.dataSource = self
        
        // 어떤 Cell이 들어갈까?
        let noteCell: UINib = UINib(nibName: "NoteTableViewCell", bundle: Bundle.main)
        noteTableView.register(noteCell, forCellReuseIdentifier: "NoteTableViewCell")
        
    }
}

extension NoteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let noteCell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        
        // noteCell 내부에 어떤 아이템이 있는지 모르잖아. - delegate도 비슷한 맥락
        noteCell.updateUI(noteItem: notes[indexPath.row], delegate: self)
        
        return noteCell
    }
    
    // DELETE
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            self.notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Cell을 눌렀다가 뗐을 때 애니메이션 (이전에는 누른 상태 그대로 였음)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let delegate = segue.destination as? NoteItemDelegate, let indexPath = selectedIndexPath {
            delegate.send(noteItem: notes[indexPath.row])
            selectedIndexPath = nil
        }
    }
    
}

extension NoteViewController: NoteCellDelegate {
    func imageTapped(noteItem: Note) {
        // noteItem의 제일 마지막 이미지를 imageView에 뿌리기
        testImageView.image = UIImage(named: noteItem.images.last ?? "IU")
    }
    
}

extension NoteViewController: AddNoteItemDelegate {
    func save(_ noteItem: Note) {
        // noteItem을 List에 추가하자.
    }
    
    
}
