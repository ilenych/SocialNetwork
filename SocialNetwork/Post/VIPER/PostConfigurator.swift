//
//  PostConfigurator.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

protocol PostConfiguratorProtocol: class {
    func configure(with viewController: PostTableViewController)
}

class PostConfigurator: PostConfiguratorProtocol {
    func configure(with viewController: PostTableViewController) {
        let presenter = PostPreesenter(view: viewController)
        let interactor = PostInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
    
}
