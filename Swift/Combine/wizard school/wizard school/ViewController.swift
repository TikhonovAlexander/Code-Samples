//
//  ViewController.swift
//  wizard school
//
//  Created by atikhonov on 11.08.2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var signupButtonStream: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupButtonStream = validatedCredentials.map { pair -> Bool in pair != nil }
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: button)
    }

    @Published var login: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""
    
    func loginAvailable(_ login: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            let available = Int.random(in: 1...10) % 2 == 0
            print("loginAvailable finished \(available)")
            completion(available)
        }
    }
    
    lazy var validLogin: AnyPublisher<String?, Never> = {
        return $login
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { login in
                return Future {  promise in
                    self.loginAvailable(login) { (available) in
                        promise(.success(available ? login : nil))
                    }
                }
            }
            .eraseToAnyPublisher()
    }()
    
    lazy var validPassword: AnyPublisher<String?, Never> = {
        return Publishers.CombineLatest($password, $passwordAgain)
            .map { (password, passwordAgain) -> String? in
            guard password == passwordAgain, password.count > 8 else { return nil }
            return password
        }
       .eraseToAnyPublisher()
    }()
    
    lazy var validatedCredentials: AnyPublisher<(String, String)?, Never> = {
        return Publishers.CombineLatest(validLogin, validPassword)
            .map { login, password in
                guard let l = login, let p = password else { return nil }
                return (l, p)
        }
        .eraseToAnyPublisher()
    }()
    
    @IBAction func loginChanged(_ sender: UITextField) {
        login = sender.text ?? ""
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
        password = sender.text ?? ""
    }
    
    @IBAction func passwordAgainChanged(_ sender: UITextField) {
        passwordAgain = sender.text ?? ""
    }
}
