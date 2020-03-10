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
    private var date = ""
    private var lstTransaction:[Transaction] = []
    
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
    
    func readDate(date: String) {
        self.date = date
    }
    
    func writeDate() -> String {
        return date
    }
    
    //database
    static func createDatabase() {
        
        
        //create table transaction
        let dbTransCommand = "CREATE TABLE Trans(transactionID INTEGER PRIMARY KEY, money INTEGER, groupType NVARCHAR(30), note NVARCHAR(100), date NVARCHAR(30), walletType NVARCHAR(30));"
        
        let dbWalletCommand = "CREATE TABLE Wallet(walletID INTEGER, totalAmout INTEGER, nameWallet NVARCHAR(30));"
        
        //SqlDataProvider.updateDatabase(dbTransCommand)
        SqlDataProvider.updateDatabase(dbWalletCommand)
        print("Tao bang thanh cong")
    }
    
    static func getTotalAmout() -> Int {
        let dbCommand = "Select Sum(money) from Trans"
        //SqlDataProvider.updateDatabase(dbCommand)
        var getStatement: OpaquePointer? = nil
        let db: OpaquePointer = SqlDataProvider.openDatabase()
        var money = 0
        
        if sqlite3_prepare(db, dbCommand, -1, &getStatement, nil) == SQLITE_OK {
            while sqlite3_step(getStatement) == SQLITE_ROW {
                money = Int(sqlite3_column_int(getStatement, 0))
            }
        } else {
            print("getRows statement could not be prepared")
        }
        
        sqlite3_finalize(getStatement)
        
        sqlite3_close(db)
        
        return money
    }
    
    //day danh sach giao dich
    func getListTransaction() -> [Transaction] {
        if lstTransaction.count == 0 {
            //Lay tat ca giao dich trong bang
            let strSQL = "Select transactionID, money, groupType, note, date, walletType from Trans"
            
            //Khai bao mang doi tuong
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
        return lstTransaction
    }
}
