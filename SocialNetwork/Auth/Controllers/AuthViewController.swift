//
//  AuthViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AuthViewController: UIViewController {
    //MARK: - Variables
    
    private var router: RouterProtocol!
    
    private lazy var loginButton: AuthButton = {
        let b = AuthButton(title: "Вход", viewWidth: self.view.frame.width, bgColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), titleColor: .white)
        b.addTarget(self, action: Selector.didTapLoginButton, for: .touchUpInside)
        return b
    }()
    
    private lazy var signupButton: AuthButton = {
        let b = AuthButton(title: "Регистрация", viewWidth: self.view.frame.width, bgColor: .white, titleColor: .black)
        b.addTarget(self, action: Selector.didTapSignupButton, for: .touchUpInside)
        return b
    }()
    
    private let label: CustomLabel  = {
        let l = CustomLabel(text: "Social Network", size: 28)
        return l
    }()
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        /// View config
        view.backgroundColor = .red
        
        /// Router
        router = Router(viewController: self)
        /// Setup
        setupSignupButton()
        setupLoginButton()
        setupLabel()
    }
    //MARK: - Functions
    
    @objc func didTapLoginButton() {
        router.openLoginViewController()
    }
    
    @objc func didTapSignupButton() {
        router.openSignupViewController()
    }
    
    //MARK: - Setup
    private func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 5)
            make.bottom.equalTo(signupButton.snp.top).offset(-30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func setupSignupButton() {
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 5)
            make.bottom.equalTo(view.frame.height / -9)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func setupLabel() {
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.frame.height / 8)
        }
    }
}
//MARK: - Selector
private extension Selector {
    static let didTapLoginButton = #selector(AuthViewController.didTapLoginButton)
    static let didTapSignupButton = #selector(AuthViewController.didTapSignupButton)
}



