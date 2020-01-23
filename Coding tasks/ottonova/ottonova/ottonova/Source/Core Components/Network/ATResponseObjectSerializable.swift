//
//  ATResponseObjectSerializable.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 ottonova. All rights reserved.
//

import Foundation

protocol ATResponseObjectSerializable: Decodable {
    static func createObject(from response: HTTPURLResponse, withData data: Data) -> Self?
}
