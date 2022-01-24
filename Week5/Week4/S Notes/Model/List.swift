//
//  List.swift
//  Week4
//
//  Created by mac on 2021/02/03.
//

import UIKit

struct Category {
    var title: String
    var total: String
    var color: String
    var notes: [Note]
}

extension Category {
    static let list : [Category] = [.A, .B, .C, .D]
    
    static let A = Category(title: "All Notes", total: String(Note.noteList1.count), color: "Green", notes: Note.noteList1)
    static let B = Category(title: "Grace", total: String(Note.noteList2.count), color: "Red", notes: Note.noteList2)
    static let C = Category(title: "Hi", total: String(Note.noteList3.count), color: "Yellow", notes: Note.noteList3)
    static let D = Category(title: "Key", total: String(Note.noteList4.count), color:"Orange", notes: Note.noteList4)
}
