//
//  TestViewController.swift
//  Week2
//
//  Created by mac on 2021/01/29.
//

import UIKit

class TestViewController: UIViewController {
    

    var delegate: UITestDelegate?
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testLabel.text =
    }
}

extension TestViewController: UITestDelegate {
    func sendData(data: String) {
        testLabel.text = data
        }

}
