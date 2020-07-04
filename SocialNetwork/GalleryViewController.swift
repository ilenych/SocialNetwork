//
//  GalleryViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit

class GalleryViewController: UIViewController {
    
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
    /// For model
    private var galleryContent = [GalleryContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Setups
        setupCollectionView()
        setupActivityIndicator()
        /// Fetch json to model
        DataFetcherService.shared.fetchGallary { (galleryModel) in
            guard let gallery = galleryModel?.gallery else { return }
            self.galleryContent = gallery
        }
    }
    
    
    //MARK: - Setups
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    func setupActivityIndicator() {
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
        return 3 //galleryContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GalleryCollectionViewCell.self), for: indexPath)
        NetworkService.shared.downloadImage(urlString: self.galleryContent[indexPath.row].img) { (image) in
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            
            DispatchQueue.main.async {
                cell.backgroundView = imageView
            }
            
            self.activityIndicator.stopAnimating()
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.white.cgColor
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension GalleryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
        
    }
}
