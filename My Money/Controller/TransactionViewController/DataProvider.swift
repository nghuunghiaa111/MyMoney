//
//  TransactionBus.swift
//  My Money
//
//  Created by Nghia Nguyen Huu on 3/2/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import Foundation

public class DataProvider {
    private static var _transactionBus:TransactionBussiness = TransactionBussiness()
    public static var transactionBus:TransactionBussiness {
        get {
            return _transactionBus
        }
    }
}

