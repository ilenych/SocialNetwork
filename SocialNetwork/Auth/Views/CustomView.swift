//
//  CustomView.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class CustomView: UIView {
    //MARK: - Variables
    lazy var textField: UITextField = {
        let e = UITextField()
        e.attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        e.textColor = .white
        e.keyboardType = UIKeyboardType.emailAddress
        return e
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// View config
        self.backgroundColor = #colorLiteral(red: 0.2626689374, green: 0.261113584, blue: 0.2638685107, alpha: 1)
        self.clipsToBounds = true
        self.addSubview(textField)
        self.addSubview(imageView)
        
        /// Setup
        setupTextField()
        setupImageView()
    }
    
    convenience init(viewWidth: CGFloat, placeholder: String, isSecureTextEntry: Bool, imageName: String) {
        self.init(frame: .zero)
        self.layer.cornerRadius = viewWidth / 12
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecureTextEntry
        imageView.image = UIImage(named: imageName)
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    fileprivate func setupTextField() {
        textField.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).offset(-90)
            make.height.equalTo(self.snp.height).offset(-26)
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
    
    fileprivate func setupImageView() {
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.height).offset(-35)
            make.height.equalTo(self.snp.height).offset(-32)
            make.leading.equalTo(26)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
}


