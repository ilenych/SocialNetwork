//
//  LoginViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    //MARK: - Variables
    var router: RouterProtocol!
    
    private let label: UILabel = {
        let l = UILabel()
        l.text = "Social Network"
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        l.textAlignment = .center
        return l
    }()
    
    private lazy var loginButton: AuthButton = {
        let b = AuthButton(title: "Вход", viewWidth: self.view.frame.width, bgColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), titleColor: .white)
        b.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return b
    }()
    
    private lazy var emailView: CustomView = {
        let v = CustomView(viewWidth: view.frame.width,
                           placeholder: "Email",
                           isSecureTextEntry: false,
                           imageName: "email")
        v.textField.delegate = self
        return v
    }()
    
    private lazy var passwordView: CustomView = {
        let v = CustomView(viewWidth: view.frame.width,
                           placeholder: "Password",
                           isSecureTextEntry: true,
                           imageName: "password")
        v.textField.delegate = self
        return v
    }()
    
    private let signupLabel: CustomLabel = {
        let l = CustomLabel(text: "Нет аккаунта?", size: 18)
        return l
    }()
    
    private lazy var signupButton: AuthButton = {
        let b = AuthButton(title: "Зарегистрироваться")
        b.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
        return b
    }()
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        /// View config
        view.backgroundColor = .black
        
        /// Router
        router = Router(viewController: self)
        
        /// Setup
        setupEmailView()
        setupPasswordView()
        setupLoginButton()
        setupImageView()
        setupSignupLabel()
        setupSignupButton()
    }
    
    //MARK: - Functions
    @objc func didTapLoginButton() {
//        guard let email = emailView.textField.text,
//               let password = passwordView.textField.text,
//               email != "", password != ""
//               else { print("Error in enter" ); return }
           
//        NetworkService.shared.login(login: "e", password: "e")
    }
    
    @objc func didTapSignupButton() {
        router.openSignupViewController()
    }
    
    //MARK: - Setup
    private func setupImageView() {
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(80)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(emailView.snp.top).offset(-50)
        }
    }
    
    private func setupEmailView() {
        view.addSubview(emailView)
        emailView.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 6)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(-100)
        }
    }
    
    private func setupPasswordView() {
        view.addSubview(passwordView)
        passwordView.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 6)
            make.top.equalTo(emailView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    private func setupSignupLabel() {
        view.addSubview(signupLabel)
        signupLabel.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 10)
            make.top.equalTo(passwordView.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func setupSignupButton() {
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 10)
            make.top.equalTo(signupLabel.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 5)
            make.bottom.equalTo(view.frame.height / -9)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
