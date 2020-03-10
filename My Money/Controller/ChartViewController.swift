//
//  ChartViewController.swift
//  My Money
//
//  Created by HuuNghia on 3/1/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lstTransaction:[Transaction] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lstTransaction = DataProvider.transactionBus.getListTransaction()
        print("Hello mother fucker: \(lstTransaction.count)")
        setupNavigationBar()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstTransaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCellID") as! TransactionTableViewCell
        cell.typeLabel.text = lstTransaction[indexPath.row].group
        cell.typeImgView.image = UIImage(named: lstTransaction[indexPath.row].group)
        cell.moneyLabel.text = String(lstTransaction[indexPath.row].money)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "TransDetailVC") as! TransDetailTableViewController
        vc.objTrans = lstTransaction[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
