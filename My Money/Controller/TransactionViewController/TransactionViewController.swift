//
//  AddViewController.swift
//  My Money
//
//  Created by HuuNghia on 2/29/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class TransactionViewController: UITableViewController, UITextFieldDelegate {
    
    var money:Int = 0
    var type: Int = 0
    
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var walletNameLabel: UILabel!
    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let name = DataProvider.transactionBus.changeNameGroupType()
        groupImageView.image = UIImage.init(named: name["name"] as! String)
        groupNameLabel.text = (name["name"] as! String)
        type = name["type"] as! Int
        noteLabel.text = DataProvider.transactionBus.readNote()
        if DataProvider.transactionBus.writeDate() == "" {
            dateLabel.text = getCurrentDate()
        } else {
            dateLabel.text = DataProvider.transactionBus.writeDate()
        }
        if name["name"] as! String != "" {
            groupImageView.backgroundColor = .clear
            groupNameLabel.textColor = .white
        } else {
            groupNameLabel.text = "Chọn nhóm"
        }
        if DataProvider.transactionBus.readNote() != "" {
            noteLabel.textColor = .white
        } else {
            noteLabel.text = "Ghi chú"
        }
        if moneyTextField.text != "" && groupNameLabel.text != "" {
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Hello Mother Fucker")
        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
        UINavigationBar.appearance().barTintColor = .black
        let leftBarButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelButtonAction))
        leftBarButton.tintColor = .white
        navigationItem.leftBarButtonItem = leftBarButton
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Lưu", style: .done, target: self, action: #selector(saveButtonAction))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        //setup groupImageView
        groupImageView.layer.cornerRadius = groupImageView.frame.height/2
        
        //setup moneyTextField
        moneyTextField.attributedPlaceholder = NSAttributedString(string: "0", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        moneyTextField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        moneyTextField.delegate = self
        
        //textfield
        
        
        
        setupCloseKeyboard()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        let allowedCharacters = "0123456789,"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        //format
        
        return count <= 15 && allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text != "" && groupNameLabel.text != "Chọn nhóm" {
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
        //textField.text = DataProvider.formatPrice(price: textField.text ?? "0")
    }
    
    func setupCloseKeyboard() {
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))

        toolbarDone.items = [barBtnDone] // You can even add cancel button too
        moneyTextField.inputAccessoryView = toolbarDone
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        if indexPath.row == 2 {
            if noteLabel.text != "Ghi chú" {
                DataProvider.transactionBus.writeNote(note: noteLabel.text ?? "")
            } else {
                DataProvider.transactionBus.writeNote(note: "")
            }
        }
        if indexPath.row == 3 {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let todayButton = UIAlertAction(title: "Ngày hôm nay", style: .default) { (todayButton) in
                self.dateLabel.text = self.getCurrentDate()
                tableView.reloadData()
            }
            let adjustButton = UIAlertAction(title: "Tuỳ chỉnh", style: .default) { (adjustButton) in
                let vc = self.storyboard?.instantiateViewController(identifier: "AdjustDateVC") as! AdjustDateViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            let cancelButton = UIAlertAction(title: "Huỷ", style: .cancel) { (cancelButton) in
                tableView.reloadData()
            }
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .darkGray
            alert.view.tintColor = .black
            alert.addAction(todayButton)
            alert.addAction(adjustButton)
            alert.addAction(cancelButton)
            present(alert, animated: true)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func cancelButtonAction() {
        resetOption()
        self.dismiss(animated: true, completion: nil)
    }

    @objc func saveButtonAction() {
        let money = Int(moneyTextField.text ?? "0") ?? 0
        var note = ""
        if noteLabel.text != "Ghi chú" {
            note = noteLabel.text!
        }
        print("Hello: \(type)")
        SqlDataProvider.insertTransaction(money: money, group: groupNameLabel.text!, note: note, date: dateLabel.text!, walletType: walletNameLabel.text!, type: type)
        resetOption()
        self.dismiss(animated: true, completion: nil)
    }
    
    func getCurrentDate() -> String {
        let today = Date()
        let weekday = Calendar.current.component(.weekday, from: today)
        let month = Calendar.current.component(.month, from: today)
        let date = Calendar.current.component(.day, from: today)
        let year = Calendar.current.component(.year, from: today)
        return "\(DataProvider.changeFormatWeekday(weekday: Calendar.current.weekdaySymbols[weekday-1])), \(date) tháng \(month) \(year)"
    }
    
    func resetOption() {
        DataProvider.transactionBus.chooseGroupType(nameGroup: "", type: 0)
        DataProvider.transactionBus.readDate(date: "")
        DataProvider.transactionBus.writeNote(note: "")
    }
    
}
