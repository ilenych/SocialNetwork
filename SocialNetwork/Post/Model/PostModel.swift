//
//  PostModel.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

struct PostModel: Decodable {
    let id: Int?
    let userName: String?
    let userUrlImage: URL?
    let time: Date?
    let postText: String?
    let postUrlImage: URL?
    let idUser: Int?
    let userId: Int?
}


