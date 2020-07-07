//
//  HeaderView.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class HeaderView: UIView {
    //MARK: - Variables
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .yellow
        iv.layer.cornerRadius = 25
        iv.clipsToBounds = true
        return iv
    }()
    
    private let title: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        l.textAlignment = .center
        l.textColor = .black
        return l
    }()
    
    private let subtitle: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        l.textAlignment = .center
        l.textColor = .gray
        return l
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupImageView()
        setupTitle()
        setupSubtitle()
    }
    
    convenience init(title: String, date: Date, imageUrl: URL) {
        self.init(frame: .zero)
        self.title.text = title
        self.subtitle.text = date.asString()
        imageView.kf.setImage(with: imageUrl)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setups
    
    private func setupImageView() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    private func setupTitle() {
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.top.equalTo(self.snp.top).offset(12)
        }
    }
    
    private func setupSubtitle() {
        self.addSubview(subtitle)
        subtitle.snp.makeConstraints { (make) in
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.top.equalTo(title.snp.bottom).offset(1)
        }
    }
}
