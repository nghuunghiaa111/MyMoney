//
//  NoteViewController.swift
//  My Money
//
//  Created by Nghia Nguyen Huu on 3/2/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        //textView
        noteTextView.text = DataProvider.transactionBus.readNote()
    }
    
    @objc func doneButtonAction() {
        DataProvider.transactionBus.writeNote(note: noteTextView.text)
        navigationController?.popViewController(animated: true)
    }

}
