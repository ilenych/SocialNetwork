//
//  GalleryModel.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation


struct GalleryModel: Decodable {
    let id: Int
    let gallery: [GalleryContent]
}

struct GalleryContent: Decodable {
    let id: Int
    let img: String
}
