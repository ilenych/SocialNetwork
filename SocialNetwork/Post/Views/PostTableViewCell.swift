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
        guard let postContent = postContent else {return HeaderView() }
        let hv = HeaderView(title: postContent.userName , date: postContent.time, imageUrl: postContent.postUrlImage)
        hv.backgroundColor = .green
        return hv
    }()
    
    private lazy var postView: PostView = {
         guard let postContent = postContent else { return PostView() }
        let pv = PostView(textContent: postContent.postText, imageUrl: postContent.postUrlImage )
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
            //                     make.height.equalTo(400)
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
