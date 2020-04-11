//
//  AvatarView+Networking.swift
//  mylivn
//
//  Created by atikhonov on 10.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

private let imageManager = ImageManager.shared

extension AvatarView {
    
    func setImage(url: URL, placeholder: UIImage? = nil, options: AvatarViewOptions = []) {
        reset()
        image = placeholder
        imageManager.loadImage(url, options: options, progress: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let progress):
                    self?.progress = CGFloat(progress)
                case .failure(let error):
                    print(error)
                }
            }
        }, completion:  { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.image = image
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}
