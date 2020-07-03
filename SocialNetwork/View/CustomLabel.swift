//
//  CustomLabel.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textAlignment = .center
        self.textColor = .white
    }
    
    convenience init(text: String, size: CGFloat) {
        self.init(frame: .zero)
        self.text = text
        self.font = UIFont(name: "AppleSDGothicNeo-Bold", size: size)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
