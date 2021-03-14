//
//  MarketingItemDetailViewController.swift
//  ClickMe
//
//  Created by Fahad on 24/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class MarketingItemDetailViewController: BaseViewController {

    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.calculateScrollHeight()
        // Do any additional setup after loading the view.
    }
    func calculateScrollHeight() {
        
        let constant:CGFloat = 700
        self.tableViewHeight.constant = 150 * 4
        self.scrollViewHeight.constant = self.tableViewHeight.constant + constant
        
    }
    
    @IBAction func actionPop(_ sender:UIButton){
              GCD.async(.Main) {
                  
                  self.navigationController?.popViewController(animated: true)
              }
          }
}
extension MarketingItemDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.ItemReviewTableViewCell.rawValue, for: indexPath) as! ItemReviewTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
