//
//  SignupViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SignupViewController: UIViewController {
    //MARK: - Variables
    private var router: RouterProtocol!
    private lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.frame = self.view.bounds
        sv.contentSize = self.contentViewSize
        return sv
    }()
    
    private lazy var containerView: UIView = {
        let v = UIView()
        v.frame.size = self.contentViewSize
        return v
    }()
    
    
    private lazy var signinButton: AuthButton = {
        let b = AuthButton(title: "Зарегистрироваться",
                           viewWidth: view.frame.width,
                           bgColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
                           titleColor: .white)
        b.addTarget(self, action: #selector(didTapSigninButton), for: .touchUpInside)
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
    
    private lazy var confirmPasswordView: CustomView = {
        let v = CustomView(viewWidth: view.frame.width,
                           placeholder: "Confirm password",
                           isSecureTextEntry: true,
                           imageName: "ConfirmPassword")
        v.textField.delegate = self
        return v
    }()
    
    fileprivate let loginLabel: CustomLabel = {
        let l = CustomLabel(text: "Уже зарегистированы?", size: 18)
        return l
    }()
    
    fileprivate lazy var loginButton: AuthButton = {
        let b = AuthButton(title: "Войти")
        b.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return b
    }()
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        /// View config
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        /// Router
        router = Router(viewController: self)
        
        /// Setup
        setupSigninButton()
        setupEmailView()
        setupPasswordView()
        setupConfirmPasswordView()
        setupLoginLabel()
        setupLoginButton()
        
        /// Notification
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    
    //MARK: - Functions
    @objc func didTapSigninButton() {

    }
    
    @objc func didTapLoginButton() {
        router.openLoginViewController()
    }
    
    fileprivate func alertControllerError() {
        let alert = UIAlertController(title: "Ошибка", message: "Произошла ошибка. Попробуйте еше раз", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    //MARK: - Setup
    private func setupEmailView() {
        containerView.addSubview(emailView)
        emailView.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 6)
            make.centerX.equalTo(containerView.snp.centerX)
            make.centerY.equalTo(containerView.snp.centerY).offset(-100)
        }
    }
    
    private func setupPasswordView() {
        containerView.addSubview(passwordView)
        passwordView.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 6)
            make.top.equalTo(emailView.snp.bottom).offset(30)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
    
    private func setupConfirmPasswordView() {
        containerView.addSubview(confirmPasswordView)
        confirmPasswordView.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 6)
            make.top.equalTo(passwordView.snp.bottom).offset(30)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
    
    private func setupLoginLabel() {
        containerView.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 10)
            make.top.equalTo(confirmPasswordView.snp.bottom).offset(10)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
    
    private func setupLoginButton() {
        containerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 10)
            make.top.equalTo(loginLabel.snp.bottom)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
    
    private func setupSigninButton() {
        containerView.addSubview(signinButton)
        signinButton.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 5)
            make.centerX.equalTo(containerView.snp.centerX)
            make.bottom.equalTo(containerView.frame.height / -9)
        }
    }
}

//MARK: - UITextFieldDelegate
extension SignupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


