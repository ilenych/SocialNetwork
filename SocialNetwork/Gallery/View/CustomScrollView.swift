//
//  CustomScrollView.swift
//  SocialNetwork
//
//  Copyright © 2020 <ASi. All rights reserved.
//
import UIKit

class CustomScrollView: UIScrollView {
    //MARK: - Variables
    var imageZoomView: UIImageView!
    
    lazy var zoomingTap: UITapGestureRecognizer = {
        let zoomingTap = UITapGestureRecognizer(target: self, action: Selector.handleZoomingTap)
        zoomingTap.numberOfTapsRequired = 2
        return zoomingTap
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setImageToCenter()
    }
    
    //MARK: - Function
    func set(image: UIImage) {
        
        imageZoomView?.removeFromSuperview()
        imageZoomView = nil
        
        imageZoomView = UIImageView(image: image)
        self.addSubview(imageZoomView)
        
        configurateFor(imaeSize: image.size)
    }
    
   private func configurateFor(imaeSize: CGSize) {
        self.contentSize = imaeSize
        
        setZoomScale()
        self.zoomScale = self.minimumZoomScale
        
        imageZoomView.addGestureRecognizer(self.zoomingTap)
        imageZoomView.isUserInteractionEnabled = true
    }
    
    private func setZoomScale() {
        
        let boundsSize = self.bounds.size
        let imageSize = imageZoomView.bounds.size
        
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        let minScale = min(xScale, yScale)
        
        var maxSclae: CGFloat = 1.0
        if minScale < 0.1 {
            maxSclae = 0.3
        }
        if minScale >= 0.1 && minScale > 0.5 {
            maxSclae = 0.7
        }
        if minScale >= 0.5{
            maxSclae = max(1.0, minScale)
        }
        
        self.minimumZoomScale = minScale
        self.maximumZoomScale = maxSclae
    }
    
    private func setImageToCenter() {
        let boundsSize = self.bounds.size
        var frameToCenter = imageZoomView.frame
        
        if frameToCenter.size.width < boundsSize.width {
            frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2
        } else {
            frameToCenter.origin.x = 0
        }
        
        if frameToCenter.size.height < boundsSize.height {
            frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height)  / 2
        } else {
            frameToCenter.origin.y = 0
        }
        
        imageZoomView.frame = frameToCenter
    }
    
    // handle
    @objc func handleZoomingTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: sender.view)
        zoom(point: location, animated: true)
    }
    
    private func zoom(point: CGPoint, animated: Bool) {
        let currentScale = zoomScale
        let minScale = self.minimumZoomScale
        let maxScale = self.maximumZoomScale
        
        guard !(minScale == maxScale && minScale > 1) else { return }
        
        let toScale = maxScale / 2
        let finalScale = (currentScale == minScale) ? toScale : minScale
        let zoomRect = self.zoomRect(scale: finalScale, center: point)
        zoom(to: zoomRect, animated: true)
    }
    
    private func zoomRect(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        let bounds = self.bounds
        
        zoomRect.size.width = bounds.size.width / scale
        zoomRect.size.height = bounds.size.height / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2)
        
        return zoomRect
    }
}
//MARK: - UIScrollViewDelegate
extension CustomScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageZoomView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        setImageToCenter()
    }
}

extension Selector {
    static let handleZoomingTap = #selector(CustomScrollView.handleZoomingTap)
}
