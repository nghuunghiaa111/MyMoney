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
        dbCommand = "CREATE TABLE Trans(transactionID INTEGER PRIMARY KEY, money INTEGER, groupType NVARCHAR(30), note NVARCHAR(100), date NVARCHAR(30), walletType NVARCHAR(30));"
        
        dbCommand = "CREATE TABLE Wallet(totalAmout INEGER, nameWallet NVARCHAR(30));"
        
        SqlDataProvider.updateDatabase(dbCommand)
        print("Tao bang thanh cong")
    }
    
    //day danh sach giao dich
    static func getListTransaction() -> [Transaction] {
        
        //Lay tat ca giao dich trong bang
        let strSQL = "Select transactionID, money, groupType, note, date, walletType from Trans"
        
        //Khai bao mang doi tuong
        var lstTransaction: [Transaction] = []
        var getStatement: OpaquePointer? = nil
        let db: OpaquePointer = SqlDataProvider.openDatabase()
        
        if sqlite3_prepare_v2(db, strSQL, -1, &getStatement, nil) == SQLITE_OK {
            //Doc tung dong de lay thong tin
            while sqlite3_step(getStatement) == SQLITE_ROW {
                let objTransaction = Transaction()
                
                let transID = sqlite3_column_int(getStatement, 0)
                objTransaction.transactionID = Int(transID)
                let money = sqlite3_column_int(getStatement, 1)
                objTransaction.money = Int(money)
                if let group = sqlite3_column_text(getStatement, 2) {
                    objTransaction.group = String(cString: group)
                }
                if let note = sqlite3_column_text(getStatement, 3) {
                    objTransaction.note = String(cString: note)
                }
                if let date = sqlite3_column_text(getStatement, 4) {
                    objTransaction.date = String(cString: date)
                }
                if let walletType = sqlite3_column_text(getStatement, 5) {
                    objTransaction.walletType = String(cString: walletType)
                }
                
                lstTransaction.append(objTransaction)
            }
        } else {
            print("getRows statement could not be prepared")
        }
        
        sqlite3_finalize(getStatement)
        
        sqlite3_close(db)
        
        return lstTransaction
    }
}
