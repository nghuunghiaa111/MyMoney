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
    
//    public static func formatPrice(price: String) -> String {
//        let priceInt = Int(price)
//        
//        
//        /*let formater = NumberFormatter()
//        formater.groupingSeparator = ","
//        formater.numberStyle = .decimal
//        formater.locale = Locale(identifier: "vi_VN")
//        return formater.string(for: priceInt) ?? "0"
//        //return String(formater.string(from: NSNumber(value: priceInt ?? 0)) ?? "0")*/
//    }
    
    public static func changeFormatWeekday(weekday: String) -> String {
        switch weekday {
        case "Monday":
            return "Thứ hai"
        case "Tuseday":
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

