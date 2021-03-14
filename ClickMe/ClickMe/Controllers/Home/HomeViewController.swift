//
//  HomeViewController.swift
//  ClickMe
//
//  Created by Fahad on 05/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tablePosts: UITableView!

    @IBOutlet weak var viewNoPosts: UIView!
    @IBOutlet weak var viewPosts: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Global.shared.mainContainerView = self.tabBarController?.parent
        
       // Global.shared.tabController = self.tabBarController as! BaseTabbarController
        self.viewNoPosts.isHidden = false
        self.tablePosts.register(UINib(nibName: TableViewCellNames.SocialPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue)
        // Do any additional setup after loading the view.
    }
    @IBAction func actionshowPosts(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewNoPosts.isHidden = true
        }
    }
    
    @IBAction func actionNewPost(_ sender:UIButton){
        GCD.async(.Main) {
            if let vc = self.instantiateVC(withDestinationViewControllerType: NewPostViewController.self, andStoryboardName: StoryBoardNames.Home.rawValue){
                self.goTo(viewController: vc, withDisplayVCType: .push)
            }
    }
    }
    
    @IBAction func actionMenu(_ sender:UIButton){
        self.showMenu()
       }
}
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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

