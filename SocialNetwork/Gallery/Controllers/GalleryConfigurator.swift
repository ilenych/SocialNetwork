//
//  GalleryConfigurator.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation


protocol GalleryConfiguratorProtocol: class {
    func configure(with viewController: GalleryViewController)
}

class GalleryConfigurator: GalleryConfiguratorProtocol {
    func configure(with viewController: GalleryViewController) {
        let presenter = GalleryPreesenter(view: viewController)
        let interactor = GalleryInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
    
}
