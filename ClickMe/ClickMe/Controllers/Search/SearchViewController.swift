//
//  SearchViewController.swift
//  ClickMe
//
//  Created by Fahad on 14/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController,UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftBar: NSLayoutConstraint!

    @IBOutlet weak var txtSearch: BaseTextFeilds!

    @IBOutlet weak var btnTags: UIButton!
    @IBOutlet weak var btnUser: UIButton!
    @IBOutlet weak var btnPost: UIButton!

    var buttonArray = [UIButton]()
    
    var selectedIndex = 0
    var selectedItems = [Int:Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: TableViewCellNames.InterestTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.InterestTableViewCell.rawValue)
        self.tableView.register(UINib(nibName: TableViewCellNames.UserTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.UserTableViewCell.rawValue)
        self.tableView.register(UINib(nibName: TableViewCellNames.SocialPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue)
        self.tableView.tableFooterView = UIView()
        self.buttonArray = [btnTags,btnUser,btnPost]
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text!.count > 0{
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: UserSearchViewController.self, andStoryboardName: StoryBoardNames.Search.rawValue){
                    vc.text = textField.text!
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
        }
        return true
    }
    
    
    @IBAction func actionMenu(_ sender:UIButton){
     self.showMenu()
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

extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.selectedIndex == 0{
            return 15
        }else if self.selectedIndex == 1{
            return 15
        }else{
            return 15
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.selectedIndex == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.InterestTableViewCell.rawValue, for: indexPath) as! InterestTableViewCell
        if let _ = self.selectedItems[indexPath.row]{
            cell.imgCheck.isHidden = false
        }else{
            cell.imgCheck.isHidden = true
        }
        return cell
        }else if self.selectedIndex == 1{
           let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.UserTableViewCell.rawValue, for: indexPath) as! UserTableViewCell
            cell.viewOtherUser.isHidden = false
           return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue, for: indexPath) as! SocialPostTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == 0{
            return 58
        }else if self.selectedIndex == 1{
            return 57
        }else{
            return 290
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if self.selectedIndex == 0{
            if let _ = self.selectedItems[indexPath.row]{
                self.selectedItems.removeValue(forKey: indexPath.row)
            }else{
                self.selectedItems[indexPath.row] = indexPath.row
            }
            GCD.async(.Main) {
                self.tableView.reloadData()
            }
        }else if self.selectedIndex == 1{
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: ProfileViewViewController.self, andStoryboardName: StoryBoardNames.Profile.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
        }else{
        }
    }
}
