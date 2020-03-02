//
//  TransactionBussiness.swift
//  My Money
//
//  Created by Nghia Nguyen Huu on 3/2/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import Foundation

public class TransactionBussiness {
    private var name = ""
    private var note = ""
    
    func changeNameGroupType() -> String {
        return name
    }
    
    func chooseGroupType(nameGroup: String) {
        name = nameGroup
    }
    
    func writeNote(note: String) {
        self.note = note
    }
    
    func readNote() -> String {
        return note
    }
}
