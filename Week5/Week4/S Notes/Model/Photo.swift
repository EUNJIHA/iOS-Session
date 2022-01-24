//
//  Photo.swift
//  Week4
//
//  Created by mac on 2021/02/19.
//

import UIKit

struct Photo {
    var url: String
    var title: String
}

extension Photo {
    static let list : [Photo] = [.A, .B, .C, .D, .E, .F]
    
    static let A = Photo(url:"https://upload.wikimedia.org/wikipedia/commons/d/de/Windows_live_square.JPG", title: "로고")
    static let B = Photo(url:"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg", title: "자연")
    static let C = Photo(url:"https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg", title: "펠리칸")
    static let D = Photo(url:"https://imgcdn.zigwheels.ph/medium/gallery/exterior/73/953/honda-xr150l-slant-front-view-full-image-209679.jpg", title: "오토바이")
    static let E = Photo(url:"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131616.jpg?crop=0.630xw:1.00xh;0.186xw,0&resize=640:*", title: "꽃")
    static let F = Photo(url:"https://static.toiimg.com/thumb/72975551.cms?width=680&height=512&imgsize=881753", title: "행성")
}
