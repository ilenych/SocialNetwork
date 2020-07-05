//
//  PagePhotoViewController.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class PagePhotoViewController: UIPageViewController {
    //MARK: -  Variables
    
    var images = [UIImage]()
    var didSelectItem: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        view.backgroundColor = .black
        
        guard let didSelectItem = didSelectItem else { return }
        
        if let contentPagePhotoVC = self.showViewControllerAtIndex(didSelectItem) {
            setViewControllers([contentPagePhotoVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    //MARK: - Functions
    private func showViewControllerAtIndex(_ index: Int) -> PhotoViewController? {
        guard index >= 0 && index < images.count else { return nil }
        
        let contentPagePhotoVC: PhotoViewController = PhotoViewController()
        contentPagePhotoVC.currentPage = index
        contentPagePhotoVC.image = images[index]
        return contentPagePhotoVC
    }
    
}
//MARK: - Extension
extension PagePhotoViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! PhotoViewController).currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! PhotoViewController).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
}
