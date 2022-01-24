//
//  TestViewController.swift
//  Week4
//
//  Created by mac on 2021/02/02.
//

import UIKit

class TestViewController: UIViewController {
    
    // var가 맞지?
    @IBOutlet var testTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- cell의 XIB와 Swift를 연결해줘야 함. (음)
        let testCellNib = UINib(nibName: "TestTableViewCell", bundle:Bundle.main)
        testTableView.register(testCellNib, forCellReuseIdentifier: "TestTableViewCell")
        
        
        testTableView.delegate = self
        testTableView.dataSource = self
    }
}


extension TestViewController: UITableViewDelegate, UITableViewDataSource{
    
    // 총 몇 개
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Library.books.count;
    }
    
    // Cell 뱉기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath)
//        let book = Library.books[indexPath.row]
//        cell.textLabel?.text = book.title
//        cell.imageView?.image = book.image
//        return cell
        
        
        
        guard let testCell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell") as? TestTableViewCell else { return UITableViewCell() } // 그래서 이걸 쓰는건가
        // Cell 만들기
        // let testCell: UITableViewCell = TestTableViewCell()
        
        
        // testCell에 데이터 채우기
        testCell.updateUI(item: Library.books[indexPath.row])
        
        // 데이터 채운 testCell return
        return testCell;
    }
    
    
}
