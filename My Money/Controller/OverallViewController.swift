//
//  WalletViewController.swift
//  My Money
//
//  Created by HuuNghia on 3/1/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class OverallViewController: UITableViewController {

    @IBOutlet weak var moneyLabel: UILabel!
    
    var lstTranaction:[Transaction] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        lstTranaction = DataProvider.transactionBus.getListTransaction()
        moneyLabel.text = String(DataProvider.transactionBus.getTotalPaidAmout())
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        lstTranaction = DataProvider.transactionBus.getListTransaction()
        
        setupNavigationBar()
        
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(touchAction))
        moneyLabel.addGestureRecognizer(touchGesture)
    }
    
    @objc func touchAction() {
        let vc = storyboard?.instantiateViewController(identifier: "BalanceVC") as! BalanceViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
