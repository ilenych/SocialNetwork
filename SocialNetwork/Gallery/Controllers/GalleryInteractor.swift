//
//  GalleryInteractor.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

protocol GalleryInteractorProtocol: class {
        func fetchGallery()
}

protocol GalleryInteractorOutputProtocol: class {
        func galleryDidReceive(_ galleryContent: [GalleryContent])
}

class GalleryInteractor {
    weak var presenter: GalleryInteractorOutputProtocol!
    
    required init(presenter: GalleryInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension GalleryInteractor: GalleryInteractorProtocol {
    func fetchGallery() {
        /// Fetch json to model
        DataFetcherService.shared.fetchGallary { [weak self] (galleryModel) in
            guard let gallery = galleryModel?.gallery else { return }
            self?.presenter.galleryDidReceive(gallery)
        }
    }
}



