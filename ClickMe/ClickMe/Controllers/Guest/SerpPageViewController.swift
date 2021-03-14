//
//  SerpPageViewController.swift
//  ClickMe
//
//  Created by Fahad on 12/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class SerpPageViewController: BaseViewController {

      @IBOutlet weak var scrollView: UIScrollView!
      @IBOutlet weak var tableViewPost: UITableView!
      @IBOutlet weak var tableViewContent: UITableView!
      @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var viewMenu: UIView!

      @IBOutlet weak var heightScroll: NSLayoutConstraint!
      @IBOutlet weak var heighttableViewPost: NSLayoutConstraint!
      @IBOutlet weak var heighttableViewUser: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewMenu.isHidden = true

    }
    
    
    func configure() {
        self.viewSearch.isHidden = true
        self.setScrollViewHeight()
         self.tableViewPost.register(UINib(nibName: TableViewCellNames.MainPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.MainPostTableViewCell.rawValue)
         self.tableViewContent.register(UINib(nibName: TableViewCellNames.ContentPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.ContentPostTableViewCell.rawValue)
    }
    
    func setScrollViewHeight(){
        
        let constant:CGFloat = 710
        self.heighttableViewPost.constant = 6 * 350
        self.heighttableViewUser.constant = 5 * 116
        
        self.heightScroll.constant = self.heighttableViewPost.constant  + self.heighttableViewUser.constant + constant
        
    }
    @IBAction func actionMenu(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewMenu.isHidden = !self.viewMenu.isHidden
        }
    }
    
    @IBAction func actionPop(_ sender:UIButton){
        GCD.async(.Main) {
            
            self.navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func actionTop(_ sender:UIButton){
           GCD.async(.Main) {
               self.scrollView.setContentOffset(.zero, animated: true)
           }
       }
    
    @IBAction func actionSearch(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewSearch.isHidden = !self.viewSearch.isHidden
            //self.scrollView.setContentOffset(.zero, animated: true)
        }
    }
}
extension SerpPageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == self.tableViewPost ? 6 : 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if tableView == self.tableViewPost{
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.MainPostTableViewCell.rawValue, for: indexPath) as! MainPostTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.ContentPostTableViewCell.rawValue, for: indexPath) as! ContentPostTableViewCell
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView == self.tableViewPost ? 350 : 116
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
