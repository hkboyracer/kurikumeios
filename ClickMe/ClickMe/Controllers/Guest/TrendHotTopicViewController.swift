//
//  TrendHotTopicViewController.swift
//  ClickMe
//
//  Created by Fahad on 13/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class TrendHotTopicViewController: BaseViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableViewPost: UITableView!
    @IBOutlet weak var heightScroll: NSLayoutConstraint!
    @IBOutlet weak var heighttableViewPost: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        // Do any additional setup after loading the view.
    }
    
    
    func configure() {
        self.setScrollViewHeight()
        self.tableViewPost.register(UINib(nibName: TableViewCellNames.MainPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.MainPostTableViewCell.rawValue)
        
    }
    
    func setScrollViewHeight(){
        
        let constant:CGFloat = 290
        self.heighttableViewPost.constant = 16 * 350
        
        self.heightScroll.constant = self.heighttableViewPost.constant  + constant
        
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
}
extension TrendHotTopicViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.MainPostTableViewCell.rawValue, for: indexPath) as! MainPostTableViewCell
            return cell
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
