//
//  Storage.swift
//  Coordinator pattern
//
//  Created by atikhonov on 14.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

class Storage {
    static let shared = Storage()
    
    private var token: String?
    
    var onboardingWasShown = false
    var isLoggined = false
    
    func login(completion: () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.token = "token"
        }
    }
    
    func logout(completion: () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.token = nil
        }
    }
}
