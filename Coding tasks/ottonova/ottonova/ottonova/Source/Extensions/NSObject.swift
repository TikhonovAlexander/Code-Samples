//
//  NSObject.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Foundation

extension NSObject {
    static func stringName() -> String {
        return String(describing: self)
    }
}
