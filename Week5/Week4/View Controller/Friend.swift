//
//  Friend.swift
//  Week4
//
//  Created by mac on 2021/02/02.
//

import UIKit

struct Friend {
    var name: String // MARK:- NAME은 반드시 있도록
    var song: String?
}

extension Friend {
    
    static let list : [Friend] = [.A, .B, .C, .D]
    
    static let A = Friend(name: "Grace", song: "Day0")
    static let B = Friend(name: "Daddy", song: "Day1")
    static let C = Friend(name: "Mommy", song: "Day2")
    static let D = Friend(name: "Brother", song: "Day3")
}
