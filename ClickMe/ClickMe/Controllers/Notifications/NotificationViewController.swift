//
//  NotificationViewController.swift
//  ClickMe
//
//  Created by Fahad on 06/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftBar: NSLayoutConstraint!

    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: TableViewCellNames.AllNotificationTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.AllNotificationTableViewCell.rawValue)
        self.tableView.register(UINib(nibName: TableViewCellNames.ReplyNotificationTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.ReplyNotificationTableViewCell.rawValue)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func actionMenu(_ sender:UIButton){
     self.showMenu()
    }

    @IBAction func actionTab(_ sender:UIButton){
        self.selectedIndex = sender.tag
        self.setTabs()
    }
    func setTabs()  {
        GCD.async(.Main) {
            self.leftBar.constant = self.selectedIndex == 0 ? 0 : ScreenSize.SCREEN_WIDTH/2
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (true) in
                self.tableView.reloadData()
            })
        }
        
    }

}

extension NotificationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedIndex == 0 ? 10 : 9
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.selectedIndex == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.AllNotificationTableViewCell.rawValue, for: indexPath) as! AllNotificationTableViewCell
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.ReplyNotificationTableViewCell.rawValue, for: indexPath) as! ReplyNotificationTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.selectedIndex == 0 ? 138 : 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
