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
    
    public static func changeFormatWeekday(weekday: String) -> String {
        switch weekday {
        case "Monday":
            return "Thứ hai"
        case "Tuesday":
            return "Thứ ba"
        case "Wednesday":
            return "Thứ tư"
        case "Thursday":
            return "Thứ năm"
        case "Friday":
            return "Thứ sáu"
        case "Saturday":
            return "Thứ bảy"
        default:
            return "Chủ nhật"
        }
    }

}

