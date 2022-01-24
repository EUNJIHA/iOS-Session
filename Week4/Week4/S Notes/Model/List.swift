//
//  List.swift
//  Week4
//
//  Created by mac on 2021/02/03.
//

import UIKit

struct List {
    var title: String
    var total: String
    var color: String
}

extension List {
    
    static var list : [List] = [.A, .B, .C, .D]
    
    static let A = List(title: "All Notes", total: String(Note.noteList1.count), color: "Green")
    static let B = List(title: "Grace", total: String(Note.noteList2.count), color: "Red")
    static let C = List(title: "Hi", total: String(Note.noteList3.count), color: "Yellow")
    static let D = List(title: "Key", total: String(Note.noteList4.count), color:"Orange")
}
