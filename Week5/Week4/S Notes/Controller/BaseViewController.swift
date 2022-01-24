//
//  BaseViewController.swift
//  Week4
//
//  Created by YOONYOUNGIL Mac Mini 2020 on 2021/02/05.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(presentAlert(_:)), name: NSNotification.Name("sceneDidBecomeActive"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("sceneDidBecomeActive"), object: nil)
    }
    
    @objc func presentAlert(_ notification: Notification) {
//        if let note = notification.object as? Note {
//            if let noteIdx = notes.firstIndex(where: { $0.id == note.id } ) {
//                notes[noteIdx] = note
//            }
//        }
    }
}
