//
//  MenuViewController.swift
//  ClickMe
//
//  Created by Fahad on 19/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!

    @IBOutlet weak var heightScrollView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableHeight.constant = CGFloat(MENU_TITLES.count * 50) + 50
        self.heightScrollView.constant = 345 + self.tableHeight.constant
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
   
    @IBAction func actionBottomOption(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
        /// +MENU_TITLES.count since  first  are table view rows
        self.handleMenuTap(index: sender.tag + MENU_TITLES.count)
    }
    
    @IBAction func actionHide(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
  
    }
    
}
extension MenuViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MENU_TITLES.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.MenuTableViewCell.rawValue, for: indexPath) as! MenuTableViewCell
        cell.configure(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.dismiss(animated: true, completion: nil)
        self.handleMenuTap(index: indexPath.row)
    }
}
