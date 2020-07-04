//
//  PhotoViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit
class PhotoViewController: UIViewController {
    //MARK: - Variables
    var currentPage = 0
    var image: UIImage!
    
    private lazy var customScrollView: CustomScrollView = {
        let csv = CustomScrollView(frame: view.bounds)
        csv.set(image: image)
        return csv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Setups
        setupCustomScrollView()
        
    }
    //MARK: - Functions
    func setupCustomScrollView() {
        view.addSubview(customScrollView)
        customScrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
