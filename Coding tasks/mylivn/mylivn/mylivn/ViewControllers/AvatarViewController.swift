//
//  AvatarViewController.swift
//  mylivn
//
//  Created by atikhonov on 09.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    
    @IBOutlet var avatarView: AvatarView!
    @IBOutlet var nextButton: UIButton!
    
    private var links = Storage.links()
    private var currentIndex = 0
    private var shouldCropNext = false
    private var placeholderNext = false
    private var placeholder: UIImage? {
        placeholderNext ? UIImage(named: "placeholder") : nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAvatarViewController()
        loadCurrent()
    }
    
    @IBAction private func nextTapped(_ sender: Any) {
        loadNext()
    }
    
    private func loadImage(for url: URL) {
        let options: AvatarViewOptions = shouldCropNext ? [.cropped, .resized(size: CGSize(width: 200, height: 200))] : []
        avatarView.setImage(url: url, placeholder: placeholder, options: options)
        shouldCropNext = false
        placeholderNext = false
    }
    
    private func prepareAvatarViewController() {
        nextButton.layer.cornerRadius = 4.0
        nextButton.layer.masksToBounds = true
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.borderWidth = 1.0
        
        title = "Avatar"
        
    }
    
    private func loadCurrent() {
        let url = currentURL()
        loadImage(for: url)
    }
    
    private func loadNext() {
        let url = nextURL()
        loadImage(for: url)
    }
    
    private func nextURL() -> URL {
        currentIndex += 1
        return links[currentIndex % links.count]
    }
    
    private func currentURL() -> URL {
        links[currentIndex % links.count]
    }
    
    @IBAction func rawImageTapped(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "ImageViewController") as? ImageViewController {
            vc.image = avatarView.image
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func clearCacheTapped(_ sender: Any) {
        ImageManager.shared.clearCache()
    }
    
    @IBAction func cropNextTapped(_ sender: Any) {
        shouldCropNext = true
    }
    
    @IBAction func placeholderTapped(_ sender: Any) {
        placeholderNext = true
    }
}

