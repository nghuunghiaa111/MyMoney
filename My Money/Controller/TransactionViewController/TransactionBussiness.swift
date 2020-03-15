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
    private var type = 0
    private var note = ""
    private var date = ""
    private var lstTransaction:[Transaction] = []
    
    func changeNameGroupType() -> [String: Any] {
        return ["name": name, "type": type]
    }
    
    func chooseGroupType(nameGroup: String, type: Int) {
        name = nameGroup
        self.type = type
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
        let dbTransCommand = "CREATE TABLE Trans(transactionID INTEGER PRIMARY KEY AUTOINCREMENT, money INTEGER, groupType NVARCHAR(30), note NVARCHAR(100), date NVARCHAR(30), walletType NVARCHAR(30), type INTEGER);"
        
        let dbWalletCommand = "CREATE TABLE Wallet(walletID INTEGER, totalAmout INTEGER, nameWallet NVARCHAR(30));"
        
//        let insert = "Insert into Wallet values (1, 0, 'Tiền mặt')"
//        let insert2 = "Insert into Wallet values (2, 0, 'Thẻ')"
//        SqlDataProvider.updateDatabase(insert)
//        SqlDataProvider.updateDatabase(insert2)
        
//        let db = "Drop table Trans"
//        SqlDataProvider.updateDatabase(db)
        
        //SqlDataProvider.updateDatabase(dbTransCommand)
//        SqlDataProvider.updateDatabase(dbWalletCommand)
        print("Tao bang thanh cong")
    }
    
    func getTotalPaidAmout() -> Int {
        let dbCommand = "Select Sum(money) from Trans Where type = 0"
        
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
    
    func getTotalReceiptAmout() -> Int {
        let dbCommand = "Select Sum(money) from Trans Where type = 1"
        
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
            getListFromSQL()
            return lstTransaction
        }
        return lstTransaction
    }
    
    func updateListTransaction() -> [Transaction] {
        lstTransaction.removeAll()
        getListFromSQL()
        return lstTransaction
    }
    
    func getListFromSQL() {
        //Lay tat ca giao dich trong bang
        let strSQL = "Select transactionID, money, groupType, note, date, walletType, type from Trans"
        
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
                
                let type = sqlite3_column_int(getStatement, 6)
                objTransaction.type = Int(type)
                
                lstTransaction.append(objTransaction)
            }
        } else {
            print("getRows statement could not be prepared")
        }
        
        sqlite3_finalize(getStatement)
        
        sqlite3_close(db)
        
    }
    
    func deleteTransaction(id: Int) {
        let deleteCommand = "Delete from Trans where transactionID = \(id)"
        SqlDataProvider.updateDatabase(deleteCommand)
    }
    
    func updateWallet(walletID: Int) {
        let money = getTotalReceiptAmout() - getTotalPaidAmout()
        let updateStr = "Update Wallet Set totalAmout = totalAmout + \(money) where walletID = \(walletID)"
        
        SqlDataProvider.updateDatabase(updateStr)
    }
    
    func getWalletBalance(walletID: Int) -> Int {
        let dbCommand = "Select totalAmout from Wallet Where walletID = \(walletID)"
        
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
}
