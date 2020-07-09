//
//  GalleryPresenter.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

protocol GalleryPresenterProtocol: class {
    var galleryContent: [GalleryContent] { get }
    var galleryContentCount: Int? { get }
    func viewDidLoad()
    func galleryContent(atIndex indexPath: IndexPath) -> GalleryContent?
}

class GalleryPreesenter {
    //MARK: - VIPER Variables
    weak var view: GalleryViewProtocol!
    var interactor: GalleryInteractorProtocol!
    
    //MARK: - Variables
    var galleryContent: [GalleryContent]  = []
    var galleryContentCount: Int? {
           galleryContent.count
       }
    
    //MARK: - Init GalleryViewProtocol
    required init(view: GalleryViewProtocol) {
        self.view = view
    }
}

//MARK: - GalleryPresenterProtocol
extension GalleryPreesenter: GalleryPresenterProtocol {
    
    func galleryContent(atIndex indexPath: IndexPath) -> GalleryContent? {
        if galleryContent.indices.contains(indexPath.row) {
            return galleryContent[indexPath.row]
        } else {
            return nil
        }
    }
    
    func viewDidLoad() {
        interactor.fetchGallery()
    }
}
//MARK: - GalleryInteractorOutputProtocol
extension GalleryPreesenter: GalleryInteractorOutputProtocol {
    func galleryDidReceive(_ galleryContent: [GalleryContent]) {
        self.galleryContent = galleryContent
    }
}
