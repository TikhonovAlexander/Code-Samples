//
//  AvatarView.swift
//  mylivn
//
//  Created by atikhonov on 09.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

@IBDesignable
class AvatarView: UIView {
    
    private var backgroundRingLayer: CAShapeLayer!
    private var imageMaskLayer: CAShapeLayer!
    private var imageLayer: CALayer!
    private var ringBackgroundLayer: CAShapeLayer!
    private var ringLayer: CAShapeLayer!
    private var gradientLayer: CAGradientLayer!
    
    var image: UIImage?{
        didSet {
            updateLayerProperties()
        }
    }
    
    var gradientColors: [UIColor] = [UIColor.cyan, UIColor.blue] {
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable var progress: CGFloat = 0.6  {
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable var lineWidth: CGFloat = 4.0  {
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 4.0  {
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable var ringOffset: CGFloat = 2.0  {
        didSet {
            updateLayerProperties()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareAvatarView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareAvatarView()
    }
    
    // MARK: Methods
    
    private func prepareAvatarView() {
        backgroundRingLayer = CAShapeLayer()
        let backgroundRingRect = bounds.insetBy(dx: borderWidth / 2.0, dy: borderWidth / 2.0)
        let backgroundRingPath = UIBezierPath(ovalIn: backgroundRingRect)
        backgroundRingLayer.path = backgroundRingPath.cgPath
        backgroundRingLayer.fillColor = nil
        backgroundRingLayer.lineWidth = borderWidth
        backgroundRingLayer.strokeColor = UIColor.black.cgColor
        layer.addSublayer(backgroundRingLayer)
        
        imageMaskLayer = CAShapeLayer()
        let insetBounds = bounds.insetBy(dx: borderWidth, dy: borderWidth)
        let innerPath = UIBezierPath(ovalIn: insetBounds)
        imageMaskLayer.path = innerPath.cgPath
        imageMaskLayer.fillColor = UIColor.black.cgColor
        imageMaskLayer.frame = bounds
        layer.addSublayer(imageMaskLayer)
        
        imageLayer = CALayer()
        imageLayer.mask = imageMaskLayer
        imageLayer.frame = bounds
        imageLayer.backgroundColor = UIColor.lightGray.cgColor
        imageLayer.contentsGravity = CALayerContentsGravity.resizeAspectFill
        layer.addSublayer(imageLayer)
        
        
        ringBackgroundLayer = CAShapeLayer()
        let ringBackgroundRect = bounds.insetBy(dx: borderWidth + ringOffset + lineWidth / 2.0, dy: borderWidth + ringOffset + lineWidth / 2.0)
        let ringBackgroundPath = UIBezierPath(ovalIn: ringBackgroundRect)
        ringBackgroundLayer.path = ringBackgroundPath.cgPath
        ringBackgroundLayer.fillColor = nil
        ringBackgroundLayer.lineWidth = lineWidth
        ringBackgroundLayer.strokeColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        ringBackgroundLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.addSublayer(ringBackgroundLayer)
        
        ringLayer = CAShapeLayer()
        let ringRect = bounds.insetBy(dx: borderWidth + ringOffset + lineWidth / 2.0, dy: borderWidth + ringOffset + lineWidth / 2.0)
        let ringPath = UIBezierPath(ovalIn: ringRect)
        ringLayer.path = ringPath.cgPath
        ringLayer.fillColor = nil
        ringLayer.lineWidth = lineWidth
        ringLayer.lineCap = .butt // .round
        ringLayer.strokeColor = UIColor.blue.cgColor
        ringLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ringLayer.transform = CATransform3DRotate(ringLayer.transform, -.pi / 2.0, 0, 0, 1.0)
        layer.addSublayer(ringLayer)
        
        gradientLayer = CAGradientLayer()
        gradientLayer.type = .conic
        gradientLayer.colors = gradientColors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.mask = ringLayer
        layer.addSublayer(gradientLayer)
        
        updateLayerProperties()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let backgroundRingRect = bounds.insetBy(dx: borderWidth / 2.0, dy: borderWidth / 2.0)
        let backgroundRingPath = UIBezierPath(ovalIn: backgroundRingRect)
        backgroundRingLayer.path = backgroundRingPath.cgPath
        backgroundRingLayer.frame = bounds
        
        let imageMaskBounds = bounds.insetBy(dx: borderWidth, dy: borderWidth)
        let imageMaskPath = UIBezierPath(ovalIn: imageMaskBounds)
        imageMaskLayer.path = imageMaskPath.cgPath
        imageMaskLayer.frame = bounds
        imageLayer.frame = bounds
        
        
        let ringBackgroundRect = bounds.insetBy(dx: borderWidth + ringOffset + lineWidth / 2.0, dy: borderWidth + ringOffset + lineWidth / 2.0)
        let ringBackgroundPath = UIBezierPath(ovalIn: ringBackgroundRect)
        ringBackgroundLayer.path = ringBackgroundPath.cgPath
        ringBackgroundLayer.frame = bounds
        
        let ringRect = bounds.insetBy(dx: borderWidth + ringOffset + lineWidth / 2.0, dy: borderWidth + ringOffset + lineWidth / 2.0)
        let ringPath = UIBezierPath(ovalIn: ringRect)
        ringLayer.path = ringPath.cgPath
        ringLayer.frame = bounds
        
        gradientLayer.frame = bounds
    }
    
    func reset() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        progress = 0
        image = nil
        CATransaction.commit()
    }
    
    private func updateLayerProperties() {
        
        ringLayer?.strokeEnd = progress
        ringLayer?.lineWidth = lineWidth
        ringBackgroundLayer?.lineWidth = lineWidth
        backgroundRingLayer?.lineWidth = borderWidth
        
        ringBackgroundLayer?.isHidden = progress == 0 || progress == 1.0
        ringLayer?.isHidden = progress == 1.0
        
        imageLayer?.contents = image?.cgImage
        
        gradientLayer?.colors = gradientColors.map { $0.cgColor }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        let bundle = Bundle(for: type(of: self))
        image = UIImage(named: "ib_cat", in: bundle, compatibleWith: nil)
    }
}

