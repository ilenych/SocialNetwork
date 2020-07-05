//
//  LikesView.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class LikesView: UIView {
    //MARK: - Variables
    
    private let fireButton: CustomLikeButton = {
        let fb = CustomLikeButton()
        fb.tag = 0
        fb.addTarget(self, action: #selector(didTapFireButton), for: .touchUpInside)
        return fb
    }()
    
    private let heartEyesButton: CustomLikeButton = {
        let heb = CustomLikeButton()
        heb.tag = 1
        heb.addTarget(self, action: #selector(didTapFireButton), for: .touchUpInside)
        return heb
    }()
    
    private let rocketButton: CustomLikeButton = {
        let rb = CustomLikeButton()
        rb.addTarget(self, action: #selector(didTapFireButton), for: .touchUpInside)
        return rb
    }()
    
    private let likeButton: CustomLikeButton = {
        let lb = CustomLikeButton()
        lb.addTarget(self, action: #selector(didTapFireButton), for: .touchUpInside)
        return lb
    }()
    
    private let bombButton: CustomLikeButton = {
        let bb = CustomLikeButton()
        bb.addTarget(self, action: #selector(didTapFireButton), for: .touchUpInside)
        return bb
    }()
    
    private let commentButton: CustomLikeButton = {
        let cb = CustomLikeButton()
        cb.addTarget(self, action: #selector(didTapFireButton), for: .touchUpInside)
        return cb
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupFireButton()
        setupHeartEyesButton()
        setupRocketButton()
        setupLikeButton()
        setupBombButton()
        setupCommentButton()
    }
    
    convenience init(fireCount: String) {
        self.init(frame: .zero)
        self.fireButton.setTitle(fireCount, for: .normal)
        self.heartEyesButton.setTitle(fireCount, for: .normal)
        self.rocketButton.setTitle(fireCount, for: .normal)
        self.likeButton.setTitle(fireCount, for: .normal)
        self.bombButton.setTitle(fireCount, for: .normal)
        self.commentButton.setTitle(fireCount, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapFireButton(sender: UIButton) {
        print(sender.titleLabel?.text)
    }
    
    
    //MARK: - Setups
    private func setupFireButton() {
        self.addSubview(fireButton)
        fireButton.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.top.equalTo(self.snp.top).offset(5)
            make.width.greaterThanOrEqualTo(50)
        }
    }
    
    private func setupHeartEyesButton() {
        self.addSubview(heartEyesButton)
        heartEyesButton.snp.makeConstraints { (make) in
            make.leading.equalTo(fireButton.snp.trailing).offset(5)
            make.top.equalTo(self.snp.top).offset(5)
            make.width.greaterThanOrEqualTo(50)
        }
    }
    
    private func setupRocketButton() {
        self.addSubview(rocketButton)
        rocketButton.snp.makeConstraints { (make) in
            make.leading.equalTo(heartEyesButton.snp.trailing).offset(5)
            make.top.equalTo(self.snp.top).offset(5)
            make.width.greaterThanOrEqualTo(50)
        }
    }
    
    private func setupLikeButton() {
        self.addSubview(likeButton)
        likeButton.snp.makeConstraints { (make) in
            make.leading.equalTo(rocketButton.snp.trailing).offset(5)
            make.top.equalTo(self.snp.top).offset(5)
            make.width.greaterThanOrEqualTo(50)
        }
    }
    
    private func setupBombButton() {
        self.addSubview(bombButton)
        bombButton.snp.makeConstraints { (make) in
            make.leading.equalTo(likeButton.snp.trailing).offset(5)
            make.top.equalTo(self.snp.top).offset(5)
            make.width.greaterThanOrEqualTo(50)
        }
    }
    private func setupCommentButton() {
        self.addSubview(commentButton)
        commentButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(self.snp.top).offset(5)
            make.width.greaterThanOrEqualTo(50)
        }
    }
}
