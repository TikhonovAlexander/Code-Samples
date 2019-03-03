//
//  NSObjectProtocol.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

extension NSObjectProtocol where Self: UIView {
    static func loadNibNamed(ofOwner owner: Any?, fromBundle bundle: Bundle = Bundle.main, options: [UINib.OptionsKey: Any]? = nil) -> Self? {
        let className = String(describing: self)
        guard let array = bundle.loadNibNamed(className, owner: owner, options: options) else { return nil }
        guard let view = array.first as? Self else { return nil }
        return view
    }
}
