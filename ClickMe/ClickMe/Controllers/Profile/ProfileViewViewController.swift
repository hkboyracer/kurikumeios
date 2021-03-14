//
//  ProfileViewViewController.swift
//  ClickMe
//
//  Created by Fahad on 17/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class ProfileViewViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftBar: NSLayoutConstraint!
    @IBOutlet weak var heightScrollView: NSLayoutConstraint!

    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnMe: UIButton!
    @IBOutlet weak var btnNice: UIButton!
    
    var buttonArray = [UIButton]()
    
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: TableViewCellNames.SocialPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue)
        self.tableView.tableFooterView = UIView()
        self.buttonArray = [btnAll,btnMe,btnNice]
        self.calculateHeight()
        // Do any additional setup after loading the view.
    }
    func calculateHeight() {
        let tableHeight = 15 * 290
        let constant = 470
        self.heightScrollView.constant = CGFloat(tableHeight + constant)
    }
    
    @IBAction func actionPop(_ sender:UIButton){
        GCD.async(.Main) {
            if let _ = self.navigationController{
                self.navigationController?.popViewController(animated: true)
            }else{
                self.showMenu()
            }
        }
    }
    @IBAction func actionTab(_ sender:UIButton){
        self.selectedIndex = sender.tag
        self.setTabs()
    }
    func setTabs()  {
        for each in self.buttonArray{
            each.setTitleColor(UIColor.darkGray, for: .normal)
        }
        self.buttonArray[selectedIndex].setTitleColor(AppColors.APP_GREEN_COLOR, for: .normal)
        GCD.async(.Main) {
            self.leftBar.constant = (0.3333 * CGFloat(self.selectedIndex)) * ScreenSize.SCREEN_WIDTH
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (true) in
                self.tableView.reloadData()
            })
        }
        
    }
}
extension ProfileViewViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if self.selectedIndex == 0{
//            return 15
//        }else if self.selectedIndex == 1{
//            return 15
//        }else{
            return 15
    //    }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue, for: indexPath) as! SocialPostTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 290
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
