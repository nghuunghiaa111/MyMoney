//
//  GroupTableViewController.swift
//  My Money
//
//  Created by Nghia Nguyen Huu on 3/1/20.
//  Copyright © 2020 HuuNghia. All rights reserved.
//

import UIKit

class GroupTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let groupPaidTypes:[String] = ["Ăn uống","Hoá đơn","Di chuyển","Xăng","Gửi xe","Mua sắm","Người yêu & Bạn bè","Giải trí","Du lịch","Sức khoẻ","Quà tặng","Gia đình","Giáo dục","Rút tiền","Khoản chi khác"]
    let groupReceiptTypes = ["Thưởng","Lương","Được tặng","Bán đồ","Khoản thu khác"]
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func segmentControlAction(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            tableView.reloadData()
        } else {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupNavigationBar()
        
        //segment control setup
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmentControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentControl.selectedSegmentIndex == 0 {
            return groupPaidTypes.count
        }
        return groupReceiptTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectGroupCellID", for: indexPath) as! GroupSelectTableViewCell
        if segmentControl.selectedSegmentIndex == 0 {
            cell.groupLabel.text = groupPaidTypes[indexPath.row]
            cell.groupImage.image = UIImage.init(named: groupPaidTypes[indexPath.row])
        } else {
            cell.groupLabel.text = groupReceiptTypes[indexPath.row]
            cell.groupImage.image = UIImage.init(named: groupReceiptTypes[indexPath.row])
        }
        
        return cell
    }
}
