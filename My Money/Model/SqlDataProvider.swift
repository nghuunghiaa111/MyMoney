//
//  SqlDataProvider.swift
//  My Money
//
//  Created by HuuNghia on 3/3/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit
import SQLite3

class SqlDataProvider: NSObject {
    //Truy xuat thu muc
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .allDomainsMask).first!
    
    //Lay duong dan den db
    static let DBURL = DocumentsDirectory.appendingPathComponent("MoneyLover.db")
    
    //Mo ket noi den database can lam viec
    static func openDatabase() -> OpaquePointer {
        print(DocumentsDirectory)
        print(DBURL)
        
        var db: OpaquePointer? = nil
        if sqlite3_open(DBURL.absoluteString, &db ) == SQLITE_OK {
            //do nothing
        } else {
            print("Khong ket noi dc database")
        }
        return db!
    }
    
    //cap nhat database
    static func updateDatabase(_ dbCommand: String) {
        var updateStatement: OpaquePointer? = nil
        let db: OpaquePointer = openDatabase()
        if sqlite3_prepare_v2(db, dbCommand, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                //do nothing
            } else {
                print("Khong thuc hien dc update trong database")
            }
        } else {
            print("Cau lenh thuc hien khong thanh cong")
        }
        sqlite3_finalize(updateStatement)
        
        //Dong ket noi
        sqlite3_close(db)
    }
    
    static func insertTransaction(money: Int, group: String, note: String, date: String, walletType: String) {
        let strInsert = "insert into Trans(money, groupType, note, date, walletType) values (\(money),'\(group)','\(note)','\(date)','\(walletType)')"
        updateDatabase(strInsert)
    }
}
