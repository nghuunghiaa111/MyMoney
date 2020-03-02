//
//  TransactionBussiness.swift
//  My Money
//
//  Created by Nghia Nguyen Huu on 3/2/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import Foundation
import SQLite3

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
    
    //database
    static func createDatabase() {
        var dbCommand: String = ""
        
        //create table transaction
        dbCommand = "CREATE TABLE Transaction(money INT, group NVARCHAR(30), note NVARCHAR(100), date NVARCHAR(30), walletType NVARCHAR(30));"
        
        SqlDataProvider.updateDatabase(dbCommand)
        print("Tao bang thanh cong")
    }
}
