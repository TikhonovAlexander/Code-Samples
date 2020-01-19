//
//  LoginViewController.swift
//  Product
//
//  Created by atikhonov on 17.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    var loginViewModel = LoginViewModel()
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var subscriptions: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let vc = storyboard!.instantiateViewController(identifier: "ProductsViewController") as! ProductsViewController
        vc.productsViewModel = ProductsViewModel(products: feedProducts())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func bind() {
        // bind view to view model
        usernameTextField
            .textPublisher
            .assign(to: \.username, on: loginViewModel)
            .store(in: &subscriptions)
        passwordTextField
            .textPublisher
            .assign(to: \.password, on: loginViewModel)
            .store(in: &subscriptions)
        
        // bind view model to view
        loginViewModel
            .$username
            .assign(to: \.text, on: usernameTextField)
            .store(in: &subscriptions)
        loginViewModel
            .$password
            .assign(to: \.text, on: passwordTextField)
            .store(in: &subscriptions)
        
        loginViewModel
            .validateCredentials
            .assign(to: \.isEnabled, on: loginButton)
            .store(in: &subscriptions)
    }
    
}
