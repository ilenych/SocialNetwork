//
//  AuthButton.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, viewWidth: CGFloat, bgColor: UIColor, titleColor: UIColor) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = viewWidth / 10
        clipsToBounds = true
    }
    
//    convenience init(title: String, view: UIView, bgColor: UIColor) {
//        self.init(title: title, view: view)
//        backgroundColor = bgColor
//        setTitleColor(.black, for: .normal)
//    }
//
    convenience init(title: String) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = .clear
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
    }
    
}
