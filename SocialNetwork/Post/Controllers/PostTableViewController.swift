//
//  PostTableViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    private var postContent = [PostModel]()
    private var likesModel = [LikesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        /// Fetch json to model
        DataFetcherService.shared.fetchPost(complition: { (postModel) in
            self.postContent = postModel
            /// Reverse aaray for display from new to old
            self.postContent.reverse()
        })
        
        DataFetcherService.shared.fetchLikes { (likesModel) in
            self.likesModel = likesModel
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postContent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        cell.postContent = postContent[indexPath.row]
        
            for likes in likesModel {
                print("post",postContent[indexPath.row].id)
                if postContent[indexPath.row].id == likes.id {
                    cell.likesContent = likes
                }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}
