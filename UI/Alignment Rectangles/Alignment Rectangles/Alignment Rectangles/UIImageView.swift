//
//  UIImageView.swift
//  Alignment Rectangles
//
//  Created by atikhonov on 20.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(named name: String, top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        let originalImage = UIImage(named: name)
        let insetImage = originalImage?.withAlignmentRectInsets(insets)
        self.init(image: insetImage)
    }
}
