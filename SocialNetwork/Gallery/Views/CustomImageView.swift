//
//  CustomImageView.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    func fetchImage(with url: URL?) {
        guard let url = url else { return }
        
        if let cashedImage = getCachedImage(url: url){
            image = cashedImage
            return
        }
        
        NetworkService.shared.downloadImage(url: url) { (image, data, response) in
            self.image = image
            self.saveImageToCache(data: data, response: response)
        }
    }
    
    private func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}

