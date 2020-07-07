//
//  PostTableViewCell.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //MARK: - Variables
    
    var postContent: PostModel?
    var likesContent: LikesModel?
    
    private lazy var headerView: HeaderView = {
        guard let title    = postContent?.userName,
              let date     = postContent?.time,
              let imageUrl = postContent?.postUrlImage
            else {return HeaderView() }
        let hv = HeaderView(title: title , date: date, imageUrl: imageUrl)
        hv.backgroundColor = .green
        return hv
    }()
    
    private lazy var postView: PostView = {
        guard let textContent = postContent?.postText,
              let imageUrl    = postContent?.postUrlImage
            else { return PostView() }
        let pv = PostView(textContent: textContent, imageUrl: imageUrl)
        pv.backgroundColor = .yellow
        return pv
    }()
    
    private lazy var likesView: LikesView = {
        guard let likesContent = likesContent  else { return LikesView() }
        let lv = LikesView(model: likesContent)
        lv.backgroundColor = .blue
        return lv
    }()
    
    //MARK: - Override
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .lightGray
        setupHeaderView()
        setupPostView()
        setupLikesView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    //MARK: - Setups
    private func setupHeaderView() {
        self.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(60)
        }
    }
    
    private func setupPostView() {
        self.addSubview(postView)
        postView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.top.equalTo(headerView.snp.bottom)
        }
    }
    
    private func setupLikesView() {
        self.addSubview(likesView)
        likesView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.top.equalTo(postView.snp.bottom)
            make.height.equalTo(100)
        }
    }
    
}
