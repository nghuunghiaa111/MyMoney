//
//  AddViewController.swift
//  My Money
//
//  Created by HuuNghia on 2/29/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class TransactionViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var walletNameLabel: UILabel!
    @IBOutlet weak var walletImageView: UIImageView!
    
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
        
        //setup groupImageView
        groupImageView.layer.cornerRadius = groupImageView.frame.height/2
        
        //setup moneyTextField
        moneyTextField.attributedPlaceholder = NSAttributedString(string: "0", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        moneyTextField.delegate = self
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
        
        return count <= 15 && allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
    func setupCloseKeyboard() {
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))

        toolbarDone.items = [barBtnDone] // You can even add cancel button too
        moneyTextField.inputAccessoryView = toolbarDone
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
}
