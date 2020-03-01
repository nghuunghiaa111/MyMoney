//
//  MoneyTableViewCell.swift
//  My Money
//
//  Created by Nghia Nguyen Huu on 3/1/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class MoneyTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var moneyTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        endEditing(true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
