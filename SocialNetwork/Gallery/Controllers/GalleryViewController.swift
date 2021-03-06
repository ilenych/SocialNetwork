//
//  GalleryViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit

protocol GalleryViewProtocol: class {
    
}

class GalleryViewController: UIViewController {
    //MARK: - VIPER Variables
    var presenter: GalleryPresenterProtocol!
    private let configure: GalleryConfiguratorProtocol = GalleryConfigurator()
    
    //MARK: - Variamles
    private lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: view.frame.width / 3, height: view.frame.width / 3)
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        let cv = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: String(describing: GalleryCollectionViewCell.self))
        cv.backgroundColor = UIColor.white
        
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    private lazy var  activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// VIPER
        configure.configure(with: self)
        presenter.viewDidLoad()
        
        /// Register cell
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: GalleryCollectionViewCell.self))
        
        /// Setups
        setupCollectionView()
        setupActivityIndicator()
    }

    //MARK: - Setups
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    private func setupActivityIndicator() {
        collectionView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.galleryContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GalleryCollectionViewCell.self), for: indexPath) as! GalleryCollectionViewCell
        
        guard let imageUrl = presenter.galleryContent(atIndex: indexPath)?.img else { return UICollectionViewCell() }
        /// Set image
        cell.imageView.fetchImage(with: imageUrl)
        /// Stop Indicator
        activityIndicator.stopAnimating()
        /// Setups layer
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension GalleryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ppvc: PagePhotoViewController = PagePhotoViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        //FIXME: - Передать zoom view 
//        guard let imageUrl = presenter.galleryContent(atIndex: indexPath)?.img else { return }
//        ppvc.images
        ppvc.didSelectItem = indexPath.row
        self.present(ppvc, animated: true)
    }
}

//MARK: - GalleryViewProtocol
extension GalleryViewController: GalleryViewProtocol {
    
}
