//
//  PostTableViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

protocol PostTableViewProtocol: class {
    func reloadData()
}

class PostTableViewController: UITableViewController {
    //MARK: - VIPER Variables 
    var presenter: PostPresenterProtocol!
    private let configure: PostConfiguratorProtocol = PostConfigurator()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        /// VIPER
        configure.configure(with: self)
        presenter.viewDidLoad()
        /// registr cell
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.postsContent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        guard let post = presenter.postContent(atIndex: indexPath) else { return UITableViewCell() }
        guard let likes = presenter.likesContent(atIndex: indexPath)  else { return UITableViewCell() }
        cell.postContent = post
        cell.likesContent = likes
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}
//MARK: - PostTableViewProtocol
extension PostTableViewController: PostTableViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
