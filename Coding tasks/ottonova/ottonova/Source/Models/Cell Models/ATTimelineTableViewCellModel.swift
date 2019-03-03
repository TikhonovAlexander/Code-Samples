//
//  ATmarketTableViewCellModel.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit


class ATTimelineTableViewSectionModel {
    var sectionTitle: String?
    var cells: [ATTimelineTableViewCellModel] = []
    
    init(sectionTitle: String?, cells: [ATTimelineTableViewCellModel]) {
        self.sectionTitle = sectionTitle
        self.cells = cells
    }
}


class ATTimelineTableViewCellModel: ATTableViewCellModel {
    
    var title: String?
    var description: String?
    
    init(title: String?, description: String?) {
        self.title = title
        self.description = description
    }
    
    var rowHeight: CGFloat {
        return 60.0
    }
    
    func configure(cell: ATTimelineTableViewCell, at indexPath: IndexPath, in tableView: UITableView) -> ATTimelineTableViewCell {
        
        cell.timelineTitleLabel.text = title
        cell.timelineDescriptionLabel.text = description
        
        return cell
    }
}
