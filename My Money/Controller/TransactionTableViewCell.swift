//
//  TransactionTableViewCell.swift
//  My Money
//
//  Created by HuuNghia on 3/9/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImgView: UIImageView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
