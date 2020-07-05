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
    func fetchDataArray<T: Decodable>(urlString: String, response: @escaping ([T]) -> ())
}

class NetworkService: DataFetcherProtocol {
    
    static let shared = NetworkService()
    
    /// Fetch data
    func fetchData<T: Decodable>(urlString: String, response: @escaping (T?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let data = try? Data(contentsOf: url)
        let decoded = decodeJSON(type: T.self, data: data)
        response(decoded)
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        print(type)
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
    /// Fetch data  if return json araay
    func fetchDataArray<T: Decodable>(urlString: String, response: @escaping ([T]) -> ()) {
        guard let url = URL(string: urlString) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        let decoder = JSONDecoder()
        do {
            let objects: [T] = try decoder.decode([T].self, from: data)
            response(objects)
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return
        }
        
    }
    /// Download  image
    func downloadImage(url: URL, completion: @escaping (_ image: UIImage)->()) {
        DispatchQueue.main.async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            let image = UIImage(data: imageData)
            if let image = image {
                completion(image)
            }
        }
    }
}
