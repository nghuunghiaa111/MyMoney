//
//  ChooseWalletTableViewController.swift
//  My Money
//
//  Created by HuuNghia on 3/15/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class ChooseWalletTableViewController: UITableViewController {

    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        cashLabel.text = formatPrice(price: DataProvider.transactionBus.getWalletBalance(walletID: 1))
        cardLabel.text = formatPrice(price: DataProvider.transactionBus.getWalletBalance(walletID: 2))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
