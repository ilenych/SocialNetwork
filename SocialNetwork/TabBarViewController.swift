//
//  TabBarViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let firstViewController = PostTableViewController()
                
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)

        let secondViewController = GalleryViewController()

        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

        let tabBarList = [firstViewController, secondViewController]

        viewControllers = tabBarList
    }

}
