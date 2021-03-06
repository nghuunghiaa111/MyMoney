//
//  File.swift
//  My Money
//
//  Created by HuuNghia on 3/1/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setupNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        UINavigationBar.appearance().barTintColor = .black
    }
    
    func formatPrice(price: Int) -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = ","
        formater.numberStyle = .decimal
        formater.locale = Locale(identifier: "vi_VN")
        return formater.string(for: price) ?? "0"
    }
}

extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}



