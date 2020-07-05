//
//  PostView.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit

class PostView: UIView {
    //MARK: - Variables
    
    private let textContent: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        l.textAlignment = .left
        l.textColor = .black
        return l
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .yellow
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
    
    convenience init(textContent: String, image: UIImage) {
        self.init(frame: .zero)
        self.textContent.text = textContent
        self.imageView.image = image
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
        }
    }
    
    private func setupImageView() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(textContent.snp.bottom).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.height.greaterThanOrEqualTo(200)
        }
    }
}

