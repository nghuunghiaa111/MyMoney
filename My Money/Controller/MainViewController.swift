//
//  MainViewController.swift
//  My Money
//
//  Created by HuuNghia on 2/29/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//        let url = NSURL(fileURLWithPath: path)
//        if let pathComponent = url.appendingPathComponent("MoneyLover.db") {
//            let filePath = pathComponent.path
//            let fileManager = FileManager.default
//            if fileManager.fileExists(atPath: filePath) {
//                print("File Available")
//            } else {
//                print("File not avaialble")
//                TransactionBussiness.createDatabase()
//            }
//        } else {
//            print("File path not available")
//        }
        TransactionBussiness.createDatabase()
        setupMiddleButton()
        
    }
    
    func setupMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.layer.cornerRadius = menuButton.frame.height/2
        view.addSubview(menuButton)
        menuButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
//        menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 588).isActive = true
//        menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -155.5).isActive = true
//        menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 155.5).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        menuButton.setImage(UIImage(named: "plus"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        print("\(view.frame.height) + \(view.frame.width)")

        view.layoutIfNeeded()
    }

    @objc func menuButtonAction() {
        let vc = storyboard?.instantiateViewController(identifier: "TransactionController") as! UINavigationController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
