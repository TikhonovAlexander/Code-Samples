//
//  ViewController.swift
//  Product
//
//  Created by atikhonov on 16.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit
import Combine

class ProductViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var updateButton: UIButton!

    var productViewModel: ProductViewModel!
    
    var subscriptions: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    private func bind() {
        
        // bind view model to view
        productViewModel.$name.assign(to: \.text, on: nameLabel).store(in: &subscriptions)
        productViewModel.$description.assign(to: \.text, on: descriptionLabel).store(in: &subscriptions)
        productViewModel.$descriptionText.assign(to: \.text, on: descriptionTextField).store(in: &subscriptions)
        productViewModel.updateAvailable.assign(to: \.isEnabled, on: updateButton).store(in: &subscriptions)
        
        // bind view to view model
        descriptionTextField
            .textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.descriptionText, on: productViewModel)
            .store(in: &subscriptions)
        
    }
    
    @IBAction func updateButtonTouchUpInside(_ sender: UIButton) {
        productViewModel.updateAction.send()
    }

}

