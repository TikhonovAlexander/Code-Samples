//
//  UITextField+Combine.swift
//  Product
//
//  Created by atikhonov on 17.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit
import Combine

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text }
            .replaceNil(with: "")
            .eraseToAnyPublisher()
    }
}
