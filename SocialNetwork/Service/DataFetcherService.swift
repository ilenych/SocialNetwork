//
//  DataFetcherService.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit

class DataFetcherService {
    
    static let shared = DataFetcherService()
    private let host = "http://localhost:3000/"
    
    var networkService: DataFetcherProtocol
    
    init(networkService: DataFetcherProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchGallary(complition: @escaping (GalleryModel?) -> ()) {
        let urlString = host + "gallery/152"
        networkService.fetchData(urlString: urlString, response: complition)
    }

}
