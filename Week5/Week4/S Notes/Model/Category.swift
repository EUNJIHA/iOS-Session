//
//  List.swift
//  Week4
//
//  Created by mac on 2021/02/03.
//

import UIKit

struct Category {
    var title: String
    var total: String { String(notes.count) }
    var color: String
    var notes: [Note]
}

extension Category {
    static let list : [Category] = [.A, .B, .C, .D]
    
    static let A = Category(title: "All Notes", color: "Green", notes: Note.noteList1)
    static let B = Category(title: "Grace", color: "Red", notes: Note.noteList2)
    static let C = Category(title: "Hi", color: "Yellow", notes: Note.noteList3)
    static let D = Category(title: "Key", color:"Orange", notes: Note.noteList4)
}
