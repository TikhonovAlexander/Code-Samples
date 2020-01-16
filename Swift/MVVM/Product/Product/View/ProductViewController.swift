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

    var productViewModel: ProductViewModel!
    
    var subscriptions: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let product = Product(name: "Coca-Cola", description: "Energy drink")
        productViewModel = ProductViewModel(product: product)
        //
        bind()
    }

    private func bind() {
        productViewModel.nameSubject.assign(to: \.text, on: nameLabel).store(in: &subscriptions)
        productViewModel.descriptionSubject.assign(to: \.text, on: descriptionLabel).store(in: &subscriptions)
    }

}

