//
//  PostPresenter.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

protocol PostPresenterProtocol: class {
    var postsContent: [PostModel] { get }
    var postContentCount: Int? { get }
    var likesContent: [LikesModel] { get }
    func viewDidLoad()
    func postContent(atIndex indexPath: IndexPath) -> PostModel?
    func likesContent(atIndex indexPath: IndexPath) -> LikesModel? 
}

class PostPreesenter {
    //MARK: - VIPER Variables
    weak var view: PostTableViewProtocol!
    var interactor: PostInteractorProtocol!
    
    //MARK: - Variables 
    var postsContent: [PostModel] = []
    var postContentCount: Int? {
        postsContent.count
    }
    var likesContent: [LikesModel] = []
    
    //MARK: - Init PostTableViewProtocol
    required init(view: PostTableViewProtocol) {
        self.view = view
    }
}

//MARK: - PostPresenterProtocol
extension PostPreesenter: PostPresenterProtocol {
    func postContent(atIndex indexPath: IndexPath) -> PostModel? {
        if postsContent.indices.contains(indexPath.row) {
            return postsContent[indexPath.row]
        } else {
            return nil
        }
    }
    /// Match two models by id
    func likesContent(atIndex indexPath: IndexPath) -> LikesModel? {
        if postsContent.indices.contains(indexPath.row) {
            var likesModel: LikesModel?
            for likes in likesContent {
                if postsContent[indexPath.row].id == likes.id {
                    likesModel = likes
                }
            }
            return likesModel
        } else {
            return nil
        }
    }
    
    func viewDidLoad() {
        interactor.fetchPosts()
        interactor.fetchLikes()
    }
}
//MARK: - PostInteractorOutputProtocol
extension PostPreesenter: PostInteractorOutputProtocol {
 
    func postsDidReceive(_ postContent: [PostModel]) {
        self.postsContent = postContent
        /// Reverse aaray for display from new to old
        self.postsContent.reverse()
        /// Reload tablew view
        view.reloadData()
    }
    
    func likesDidReceive(_ likesContent: [LikesModel]) {
        self.likesContent = likesContent
        /// Reload tablew view
        view.reloadData()
     }
    
    
}
