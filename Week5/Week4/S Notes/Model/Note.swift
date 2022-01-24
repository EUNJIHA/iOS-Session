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
    var images: [String]
}

extension Note {
    
    static let noteList1 : [Note] = [.A, .B, .C, .D, .E, .F, .G]
    
    static let A = Note(category: "Grace", title: "안녕하세요", time: "4/2/2021 16:32", content: "dsdsdsd", images: ["akmu", "UI"])
    static let B = Note(category: "Grace", title: "오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "3/2/2021 14:25", content: "1238729384", images: ["woman"])
    static let C = Note(category: "Grace", title: "Hi", time: "1/2/2021 08:14", images: [])
    static let D = Note(category: "Grace", title: "안녕~ 오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "29/1/2021 07:52", images: [])
    static let E = Note(category: "Hi", title: "안녕하세요", time: "4/2/2021 16:32", images: ["IU"])
    static let F = Note(category: "Hi", title: "오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "3/2/2021 14:25", images: ["woman"])
    static let G = Note(category: "Key", title: "오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "3/2/2021 14:25", images: ["woman"])

    
    
    static let noteList2 : [Note] = [.A2, .B2]

    static let A2 = Note(title: "안녕하세요", time: "4/2/2021 16:32", images: ["akmu", "IU"])
    static let B2 = Note(title: "오늘은 무엇을 했을까요 좀 더 길게 써볼까요? 얼마나 길게 나올까요? 길이 제한은 어디?", time: "3/2/2021 14:25", images: ["woman", "akmu"])
    
    
    static let noteList3 : [Note] = [.A3]

    static let A3 = Note(title: "Hi", time: "1/2/2021 08:14", images: [])

    static let noteList4 : [Note] = []


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
