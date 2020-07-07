//
//  PostInteractor.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

protocol PostInteractorProtocol: class {
    func fetchPosts()
    func fetchLikes()
}

protocol PostInteractorOutputProtocol: class {
    func postsDidReceive(_ postContent: [PostModel])
    func likesDidReceive(_ likesContent: [LikesModel])
}

class PostInteractor {
    weak var presenter: PostInteractorOutputProtocol!
    
    required init(presenter: PostInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension PostInteractor: PostInteractorProtocol {
    func fetchPosts() {
        DataFetcherService.shared.fetchPost(complition: { [weak self] (postModel) in
            self?.presenter.postsDidReceive(postModel)
        })
    }
    
    func fetchLikes() {
        DataFetcherService.shared.fetchLikes { [weak self] (likesModel) in
            self?.presenter.likesDidReceive(likesModel)
        }
    }
    
    
}


