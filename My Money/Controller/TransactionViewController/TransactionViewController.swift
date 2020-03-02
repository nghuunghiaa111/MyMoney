//
//  AddViewController.swift
//  My Money
//
//  Created by HuuNghia on 2/29/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class TransactionViewController: UITableViewController {
    
    let cellIDs = ["MoneyCell","GroupCell","NoteCell","CalenderCell","WalletCell"]
    let cellController:[UITableViewCell] = [MoneyTableViewCell(),GroupTableViewCell(),NoteTableViewCell(),CalendarTableViewCell(),WalletTableViewCell()]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
        UINavigationBar.appearance().barTintColor = .black
        let leftBarButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelButtonAction))
        leftBarButton.tintColor = .white
        navigationItem.leftBarButtonItem = leftBarButton
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Lưu", style: .done, target: self, action: #selector(saveButtonAction))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        //close keyboard
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        view.addGestureRecognizer(tap)
    }
    
    func setupCloseKeyboard() {
        let cell = MoneyTableViewCell()
        let textField = cell.moneyTextField
        let toolBar = UIToolbar()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        textField?.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func cancelButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func saveButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //tableview protocol
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIDs.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(cellIDs[indexPath.row])
    }
}
