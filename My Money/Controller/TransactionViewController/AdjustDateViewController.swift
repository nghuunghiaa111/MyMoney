//
//  AdjustDateViewController.swift
//  My Money
//
//  Created by Nghia Nguyen Huu on 3/2/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit
import FSCalendar

class AdjustDateViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet var calendar: FSCalendar!
    
    var dateStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonAction))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        setupCalendar()
    
    }
    
    @objc func doneButtonAction() {
        DataProvider.transactionBus.readDate(date: dateStr)
        navigationController?.popViewController(animated: true)
    }
    
    func setupCalendar() {
        //let calendar = FSCalendar()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scrollDirection = .vertical

    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let weekday = Calendar.current.component(.weekday, from: date)
        let month = Calendar.current.component(.month, from: date)
        let day = Calendar.current.component(.day, from: date)
        let year = Calendar.current.component(.year, from: date)
        dateStr = "\(DataProvider.changeFormatWeekday(weekday: Calendar.current.weekdaySymbols[weekday-1])), \(day) tháng \(month) \(year)"
        navigationItem.rightBarButtonItem?.isEnabled = true
    }

}
