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
        lstTranaction = TransactionBussiness.getListTransaction()
        moneyLabel.text = "\(lstTranaction[1].money)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        lstTranaction = TransactionBussiness.getListTransaction()
        
        setupNavigationBar()
        print(lstTranaction.count)
        
    }
}
