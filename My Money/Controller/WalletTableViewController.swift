//
//  WalletTableViewController.swift
//  My Money
//
//  Created by HuuNghia on 3/8/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class WalletTableViewController: UITableViewController {

    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        cashLabel.text = formatPrice(price: DataProvider.transactionBus.getWalletBalance(walletID: 1))
        cardLabel.text = formatPrice(price: DataProvider.transactionBus.getWalletBalance(walletID: 2))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "WalletDetailVC") as! WalletDetailViewController
        if indexPath.row == 0 {
            vc.title = "Tiền mặt"
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            vc.title = "Thẻ"
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
