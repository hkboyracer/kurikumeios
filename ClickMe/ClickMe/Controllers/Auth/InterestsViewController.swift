//
//  InterestsViewController.swift
//  ClickMe
//
//  Created by Fahad on 05/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class InterestsViewController: BaseViewController {
    @IBOutlet weak var tableInterests: UITableView!

    
    var selectedItems = [Int:Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableInterests.register(UINib(nibName: TableViewCellNames.InterestTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.InterestTableViewCell.rawValue)
        self.tableInterests.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionDone(_ sender:UIButton){
               self.openMainTabBar()
        }
    
    
}
extension InterestsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.InterestTableViewCell.rawValue, for: indexPath) as! InterestTableViewCell
        if let _ = self.selectedItems[indexPath.row]{
            cell.imgCheck.isHidden = false
        }else{
            cell.imgCheck.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let _ = self.selectedItems[indexPath.row]{
            self.selectedItems.removeValue(forKey: indexPath.row)
        }else{
            self.selectedItems[indexPath.row] = indexPath.row
        }
        GCD.async(.Main) {
            self.tableInterests.reloadData()
        }
    }
}
