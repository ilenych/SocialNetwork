//
//  GalleryCollectionViewCell.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit

class GalleryCollectionViewCell: UICollectionViewCell {
    var imageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override func draw(_ rect: CGRect) {
        setupsImageView()
    }
    
    private func setupsImageView() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
