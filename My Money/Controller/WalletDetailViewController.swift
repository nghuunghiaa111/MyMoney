//
//  WalletDetailViewController.swift
//  My Money
//
//  Created by HuuNghia on 3/8/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class WalletDetailViewController: UIViewController {

    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
    }
    
    @objc func editAction() {
        let alert = UIAlertController(title: "Điều chỉnh số dư", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "0"
            textField.keyboardType = .numberPad
        }
        let saveButton = UIAlertAction(title: "Save", style: .default) { (button) in
            let textField = alert.textFields![0] as UITextField
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(saveButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
