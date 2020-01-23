//
//  ATTimelineTableViewCell.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ATTimelineTableViewCell: UITableViewCell {

    @IBOutlet var timelineImageView: UIImageView!
    @IBOutlet var timelineTitleLabel: UILabel!
    @IBOutlet var timelineDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        timelineImageView.layer.cornerRadius = 50.0 / 2.0
        timelineImageView.layer.masksToBounds = true
        timelineImageView.backgroundColor = UIColor.darkSnow
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        let color = timelineImageView.backgroundColor
        super.setSelected(selected, animated: animated)
        if selected {
            timelineImageView.backgroundColor = color
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let color = timelineImageView.backgroundColor
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            timelineImageView.backgroundColor = color
        }
    }
}
