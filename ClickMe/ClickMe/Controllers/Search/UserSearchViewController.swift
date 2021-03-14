
//
//  UserSearchViewController.swift
//  ClickMe
//
//  Created by Fahad on 08/02/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class UserSearchViewController: BaseViewController {
        @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var leftBar: NSLayoutConstraint!
    @IBOutlet weak var txtSearch: BaseTextFeilds!
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var viewDate: UIView!

    
        var selectedIndex = 0
    var text = ""
        override func viewDidLoad() {
            super.viewDidLoad()
            self.txtSearch.text = text
            self.tableView.register(UINib(nibName: TableViewCellNames.SocialPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue)
            
            
            // Do any additional setup after loading the view.
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       self.viewMenu.isHidden = true
        self.viewDate.isHidden = true
    }
        @IBAction func actionMenu(_ sender:UIButton){
         GCD.async(.Main) {
            self.viewDate.isHidden = true
             self.viewMenu.isHidden = !self.viewMenu.isHidden
         }
    }
    @IBAction func applyDate(_ sender:UIButton){
    GCD.async(.Main) {
        self.viewDate.isHidden = true
    }
    }

    @IBAction func actionPop(_ sender:UIButton){
           GCD.async(.Main) {
            self.navigationController?.popViewController(animated: true)
        }
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
    
     @IBAction func actionMenuOptions_ (_ sender:UIButton){
            
            switch sender.tag {
            case 0:
        
                break
            case 1:
          
                break
            case 2:
           
                break
            case 3:
    
                break
            case 4:
                
                break
            case 5:
                self.viewMenu.isHidden = true
                self.viewDate.isHidden = false
                
                break
            default:
                break
            }
        }
    }

extension UserSearchViewController:UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.selectedIndex == 0 ? 7 : 2
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if self.selectedIndex == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue, for: indexPath) as! SocialPostTableViewCell
            return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue, for: indexPath) as! SocialPostTableViewCell
                return cell
            }
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 290
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
}
