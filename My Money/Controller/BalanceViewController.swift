//
//  BalanceViewController.swift
//  My Money
//
//  Created by HuuNghia on 3/8/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class BalanceViewController: UITableViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let cash = DataProvider.transactionBus.getWalletBalance(walletID: 1)
        let card = DataProvider.transactionBus.getWalletBalance(walletID: 2)
        cashLabel.text = formatPrice(price: cash)
        cardLabel.text = formatPrice(price: card)
        totalLabel.text = formatPrice(price: card + cash)
        currentLabel.text = formatPrice(price: card + cash)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
        title = "Tài chính hiện tại"
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "WalletDetailVC") as! WalletDetailViewController
        if indexPath.section == 1 && indexPath.row == 1 {
            vc.title = "Tiền mặt"
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 2 {
            vc.title = "Thẻ"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


