//
//  ATTableViewCellModel.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

protocol ATTableViewCellModel {
    associatedtype CellType: UITableViewCell
    var rowHeight: CGFloat { get }
    @discardableResult func configure(cell: CellType, at indexPath: IndexPath, in tableView: UITableView) -> CellType
}

extension ATTableViewCellModel {
    static var cellType: UITableViewCell.Type {
        return CellType.self
    }
}
