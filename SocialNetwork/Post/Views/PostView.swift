//
//  PostView.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class PostView: UIView {
    //MARK: - Variables
    
    private let textContent: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        l.textAlignment = .left
        l.numberOfLines = 0
        l.backgroundColor = .blue
        l.textColor = .black
        return l
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .black
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 2
        iv.clipsToBounds = true
        return iv
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupTextContent()
        setupImageView()
    }
    
    convenience init(textContent: String, imageUrl: URL) {
        self.init(frame: .zero)
        self.textContent.text = textContent
        imageView.kf.setImage(with: imageUrl)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setups
    private func setupTextContent() {
        self.addSubview(textContent)
        textContent.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(self.snp.top).offset(5)
            make.height.lessThanOrEqualTo(200)
        }
    }
    
    private func setupImageView() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(textContent.snp.bottom).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.height.lessThanOrEqualTo(400)
        }
    }
}

