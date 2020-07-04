//
//  NetworkService.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit

protocol DataFetcherProtocol {
    func fetchData<T: Decodable>(urlString: String, response: @escaping (T?) -> ())
}

class NetworkService: DataFetcherProtocol {
    
    static let shared = NetworkService()
    
    func fetchData<T: Decodable>(urlString: String, response: @escaping (T?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let data = try? Data(contentsOf: url)
        let decoded = decodeJSON(type: T.self, data: data)
        response(decoded)
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
    func downloadImage(urlString: String, completion: @escaping (_ image: UIImage)->()) {
        DispatchQueue.main.async {
            guard let imageUrl = URL(string: urlString) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            let image = UIImage(data: imageData)
            if let image = image {
                completion(image)
            }
        }
    }
}
