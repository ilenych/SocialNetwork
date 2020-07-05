//
//  DataFetcherService.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit

class DataFetcherService {
    //MARK: - Variables
    static let shared = DataFetcherService()
    private let host = "http://localhost:3000/"
    
    var networkService: DataFetcherProtocol
    
    init(networkService: DataFetcherProtocol = NetworkService()) {
        self.networkService = networkService
    }
    //MARK: - Functions
    func fetchGallary(complition: @escaping (GalleryModel?) -> ()) {
        let urlString = host + "gallery/152"
        networkService.fetchData(urlString: urlString, response: complition)
    }
    
    func fetchPost(complition: @escaping ([PostModel]) -> ()) {
        let urlString = host + "users/152/wall"
        networkService.fetchDataArray(urlString: urlString, response: complition)
    }
    
    func fetchLikes(complition: @escaping ([LikesModel]) -> ()) {
        let urlString = host + "likes"
        networkService.fetchDataArray(urlString: urlString, response: complition)
    }
    
}
