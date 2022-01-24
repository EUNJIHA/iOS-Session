//
//  ViewController.swift
//  Week4
//
//  Created by mac on 2021/02/01.
//

import UIKit

class ViewController: UIViewController {

    var friends: [Friend] = Friend.list
    

    @IBOutlet var friendTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        friendTableView.dataSource = self
        friendTableView.delegate = self
        
        let friendCell = UINib(nibName: "FriendTableViewCell", bundle: Bundle.main) // ???? 여기 무슨 뜻이지?
        friendTableView.register(friendCell, forCellReuseIdentifier: "friendViewCell")
    }

}

// MARK:- DataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK:- DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Friend.list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendViewCell") as? FriendTableViewCell else {
            return UITableViewCell() // 왜 이렇게 하는거죠??????
        }
        
        // MARK:- UPDATE 하는 과정?
        cell.updateUI(friend: friends[indexPath.row])
        return cell;
    }
    
    // MARK:- Delegate
    
}
