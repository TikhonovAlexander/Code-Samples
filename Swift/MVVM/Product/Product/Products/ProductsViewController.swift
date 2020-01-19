//
//  ProductsViewController.swift
//  Product
//
//  Created by atikhonov on 19.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit
import Combine

class ProductsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    
    var productsViewModel: ProductsViewModel!
    
    var subscriptions: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productsViewModel.updateViewModels()
    }
    
    private func bind() {
        // bind view model to view
        productsViewModel.$productViewModels
            .receive(on: DispatchQueue.main)
            .sink { [weak self] productCellViewModels in
                self?.tableView.reloadData()
            }
            .store(in: &subscriptions)
        

        // bind view to view model
        searchTextField
            .textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.searchText, on: productsViewModel)
            .store(in: &subscriptions)
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsViewModel.productViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let productViewModel = productsViewModel.productViewModels[indexPath.row]
        cell.productViewModel = productViewModel
        return cell
    }
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        vc.productViewModel = productsViewModel.productViewModel(at: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
}
