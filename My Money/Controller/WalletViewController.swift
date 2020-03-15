//
//  ViewController.swift
//  My Money
//
//  Created by HuuNghia on 2/29/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let cash = DataProvider.transactionBus.getWalletBalance(walletID: 1)
        let card = DataProvider.transactionBus.getWalletBalance(walletID: 2)
        totalLabel.text = "Tổng tiền: \(formatPrice(price: cash + card))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
        
    }
    
    

}

