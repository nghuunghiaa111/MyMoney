//
//  GroupTableViewCell.swift
//  My Money
//
//  Created by Nghia Nguyen Huu on 3/1/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupImageView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupImageView() {
        groupImage.layer.cornerRadius = groupImage.frame.height/2
    }

}
