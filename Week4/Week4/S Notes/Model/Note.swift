//
//  Note.swift
//  Week4
//
//  Created by mac on 2021/02/04.
//

import UIKit

struct Note {

    var category: String?
    var title: String?
    var time: String
    var content: String?
    var image: [String]?
//    var listName: String?
}

extension Note {
    
    static var noteList1 : [Note] = [.A, .B, .C, .D, .E, .F, .G]
    
    static let A = Note(category: "Grace", title: "안녕하세요", time: "4/2/2021 16:32", content: "dsdsdsd", image: ["akmu", "UI"])
    static let B = Note(category: "Grace", title: "오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "3/2/2021 14:25", content: "1238729384", image: ["woman"])
    static let C = Note(category: "Grace", title: "Hi", time: "1/2/2021 08:14", image: [])
    static let D = Note(category: "Grace", title: "안녕~ 오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "29/1/2021 07:52", image: [])
    static let E = Note(category: "Hi", title: "안녕하세요", time: "4/2/2021 16:32", image: ["IU"])
    static let F = Note(category: "Hi", title: "오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "3/2/2021 14:25", image: ["woman"])
    static let G = Note(category: "Key", title: "오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "3/2/2021 14:25", image: ["woman"])

    
    
    static var noteList2 : [Note] = [.A2, .B2]

    static let A2 = Note(title: "안녕하세요", time: "4/2/2021 16:32", image: ["akmu", "IU"])
    static let B2 = Note(title: "오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "3/2/2021 14:25", image: ["woman", "akmu"])
    
    
    static var noteList3 : [Note] = [.A3]

    static let A3 = Note(title: "Hi", time: "1/2/2021 08:14", image: [])

    static var noteList4 : [Note] = []


    static func saveImage(_ image: UIImage, forBook noteItem: Note) {
        let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(noteItem.title ?? "")
      if let jpgData = image.jpegData(compressionQuality: 0.7) {
        try? jpgData.write(to: imageURL, options: .atomicWrite)
      }
    }
    
    static func loadImage(forBook noteItem: Note) -> UIImage? {
        let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(noteItem.title ?? "")
      return UIImage(contentsOfFile: imageURL.path)
    }
}


extension FileManager {
  static var documentDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
