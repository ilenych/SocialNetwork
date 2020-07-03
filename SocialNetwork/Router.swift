//
//  Router.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit

protocol RouterProtocol {
    func openLoginViewController()
    func openSigninViewController()
//    func openMainViewController()
}

class Router {
    weak var viewController: UIViewController!
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension Router: RouterProtocol {
 
    
    func openLoginViewController() {
        let loginViewController: LoginViewController = LoginViewController()
        loginViewController.modalTransitionStyle = .crossDissolve
        loginViewController.modalPresentationStyle = .overCurrentContext
        viewController.present(loginViewController, animated: true, completion: nil)
    }
    
    func openSigninViewController() {
        
    }
    
}
