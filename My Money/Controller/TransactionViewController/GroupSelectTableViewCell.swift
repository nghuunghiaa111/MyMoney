//
//  GroupSelectTableViewCell.swift
//  My Money
//
//  Created by HuuNghia on 3/1/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class GroupSelectTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        groupImage.layer.cornerRadius = groupImage.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
