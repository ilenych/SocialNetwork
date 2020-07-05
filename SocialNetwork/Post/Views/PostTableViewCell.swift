//
//  PostTableViewCell.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var title = ""
    var subtitle = ""
    var imageStr = ""
    
    private lazy var headerView: HeaderView = {
        let hv = HeaderView(title: title, subtitle: subtitle, image: UIImage(named: imageStr)!)
        hv.backgroundColor = .green
        return hv
    }()

    private lazy var postView: PostView = {
       let pv = PostView(textContent: title, image: UIImage(named: imageStr)!)
        pv.backgroundColor = .yellow
        return pv
    }()
    
    private lazy var likesView: LikesView = {
       let lv = LikesView(fireCount: "🔥 2412")
        lv.backgroundColor = .blue
        return lv
    }()
    
    
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
                     make.height.equalTo(300)
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
