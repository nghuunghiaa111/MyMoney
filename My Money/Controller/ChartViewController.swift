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
    @IBOutlet weak var grossLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lstTransaction = DataProvider.transactionBus.updateListTransaction()
        costLabel.text = formatPrice(price: DataProvider.transactionBus.getTotalPaidAmout())
        grossLabel.text = formatPrice(price: DataProvider.transactionBus.getTotalReceiptAmout())
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        cell.moneyLabel.text = formatPrice(price: lstTransaction[indexPath.row].money)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "TransDetailVC") as! TransDetailTableViewController
        vc.objTrans = lstTransaction[indexPath.row]
        print(lstTransaction[indexPath.row].type)
        print(lstTransaction[indexPath.row].group)
        navigationController?.pushViewController(vc, animated: true)
    }
}
