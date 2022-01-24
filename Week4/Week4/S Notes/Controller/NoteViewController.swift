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
class NoteViewController: UIViewController {
    
    // MARK:- Delegate
//    var delegate: NoteItemDelegate?
    
    var finalList: [Note]?
    
//    var noteList1: [Note] = Note.noteList1
//    var noteList2: [Note] = Note.noteList2
//    var noteList3: [Note] = Note.noteList3

    @IBOutlet var testImageView: UIImageView!
    
    // 현재는 segue로 구현되어 있는데 -> Delegate 등으로 바꿔 볼까요.
    var listItem: List?
    @IBOutlet var addButton: UIButton!
    @IBOutlet var noteTableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title 받아오기
        self.navigationItem.title = listItem?.title
        
        switch listItem?.title {
        case List.list[0].title:
            finalList = Note.noteList1
        case List.list[1].title:
            finalList = Note.noteList2
        case List.list[2].title:
            finalList = Note.noteList3
        default:
            break
        }
        
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
        return finalList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let noteCell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        
        // noteCell 내부에 어떤 아이템이 있는지 모르잖아. - delegate도 비슷한 맥락
        noteCell.updateUI(noteItem: finalList?[indexPath.row] ?? Note(title: "", time: "", image: [""]), delegate: self)
        
        // MARK:- TEST
        //        noteCell.delegate = self
        return noteCell
    }
    
    // DELETE
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            self.finalList?.remove(at: indexPath.row)
            Note.noteList1.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //
    //    }
    
    
    
    // Cell을 눌렀다가 뗐을 때 애니메이션 (이전에는 누른 상태 그대로 였음)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        tableView.deselectRow(at: indexPath, animated: true)
        //
        // MARK:- Delegate
        //        delegate?.send(noteItem: finalList?[indexPath.row] ?? Note(title: "", time: "", image: [""]))
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let delegate = segue.destination as? NoteItemDelegate, let indexPath = noteTableView.indexPathForSelectedRow {
            
            delegate.send(noteItem: finalList?[indexPath.row] ?? Note(title: "", time: "", image: [""]))
            //            destination.listItem = finalList[noteTableView.indexPathForSelectedRow?.row ?? 0]
            //            self.delegate = destination
            // Question) deselectRow 애니메이션을 위해 다음과 같이 작성했는데, !를 사용할 수 밖에 없는 것인가?
            noteTableView.deselectRow(at: noteTableView.indexPathForSelectedRow!, animated: true)
            
            //            self.hidesBottomBarWhenPushed = true
            
        }
    }
    
}

extension NoteViewController: NoteCellDelegate {
    func imageTapped(noteItem: Note) {
        // noteItem의 제일 마지막 이미지를 imageView에 뿌리기
        testImageView.image = UIImage(named: noteItem.image?.last ?? "IU")
    }

}

extension NoteViewController: AddNoteItemDelegate {
    func send(_ noteItem: Note) {
        // noteItem을 List에 추가하자.
    }
    
    
}
