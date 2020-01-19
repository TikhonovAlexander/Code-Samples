//
//  LoginViewModel.swift
//  Product
//
//  Created by atikhonov on 17.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel {
    
    @Published var username: String?
    @Published var password: String?
    
    lazy var validateCredentials = Publishers.CombineLatest($username, $password)
        .map { (username, password) -> (String, String) in
            let username = username ?? ""
            let password = password ?? ""
            return (username, password)
        }
        .map { (username, password) -> Bool in
            !username.isEmpty && !password.isEmpty
        }
        .eraseToAnyPublisher()
    
}
