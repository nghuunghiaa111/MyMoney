//
//  TransDetailTableViewController.swift
//  My Money
//
//  Created by HuuNghia on 3/10/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class TransDetailTableViewController: UITableViewController {

    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var objTrans = Transaction()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(objTrans.type)
        if objTrans.type == 0 {
            moneyLabel.textColor = .red
        } else {
            moneyLabel.textColor = .green
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        title = "Chi tiết giao dịch"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sửa", style: .done, target: self, action: #selector(editAction))
        
        typeImage.image = UIImage(named: objTrans.group)
        typeLabel.text = objTrans.group
        moneyLabel.text = formatPrice(price: objTrans.money)
        dateLabel.text = objTrans.date
    }
    
    @objc func editAction() {
        let vc = storyboard?.instantiateViewController(identifier: "TransactionController") as! UINavigationController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            DataProvider.transactionBus.deleteTransaction(id: objTrans.transactionID)
            navigationController?.popViewController(animated: true)
        }
    }
}
