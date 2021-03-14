//
//  MainPageViewController.swift
//  ClickMe
//
//  Created by Fahad on 08/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class MainPageViewController: BaseViewController,UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var tableViewPost: UITableView!
    @IBOutlet weak var tableViewUser: UITableView!
    @IBOutlet weak var collectionSlider: UICollectionView!
    @IBOutlet weak var collectionTopHash: UICollectionView!
    @IBOutlet weak var collectionBottomHash: UICollectionView!
    @IBOutlet weak var heightScroll: NSLayoutConstraint!
    @IBOutlet weak var heighttableViewPost: NSLayoutConstraint!
    @IBOutlet weak var heighttableViewUser: NSLayoutConstraint!
    
    @IBOutlet weak var txtSearch: BaseTextFeilds!
    
    var currentSliderIndex = 0
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
        self.setScrollViewHeight()
        self.tableViewPost.register(UINib(nibName: TableViewCellNames.MainPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.MainPostTableViewCell.rawValue)
        self.tableViewUser.register(UINib(nibName: TableViewCellNames.UserTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.UserTableViewCell.rawValue)
        self.collectionTopHash.register(UINib(nibName: CollectionViewCellNames.HashTagCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellNames.HashTagCollectionViewCell.rawValue)
        self.collectionBottomHash.register(UINib(nibName: CollectionViewCellNames.HashTagCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellNames.HashTagCollectionViewCell.rawValue)
        self.collectionSlider.register(UINib(nibName: CollectionViewCellNames.MainSliderCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellNames.MainSliderCollectionViewCell.rawValue)
        
        
        
    }
    
    func setScrollViewHeight(){
        
        let constant:CGFloat = 1025
        self.heighttableViewPost.constant = 6 * 350
        self.heighttableViewUser.constant = 5 * 90
        self.heightScroll.constant = self.heighttableViewPost.constant  + self.heighttableViewUser.constant + constant
    }
    
    @IBAction func actionNextImage(_ sender:UIButton){
        self.currentSliderIndex += self.currentSliderIndex < 2  ? 1 : 0
        self.scrollSliderToIndex()
    }
    
    @IBAction func actionPrevImage(_ sender:UIButton){
        self.currentSliderIndex -= self.currentSliderIndex > 0 ? 1 : 0
        self.scrollSliderToIndex()
    }
    
    func scrollSliderToIndex() {
        GCD.async(.Main) {
            self.collectionSlider.scrollToItem(at: IndexPath(row: self.currentSliderIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func actionTop(_ sender:UIButton){
        GCD.async(.Main) {
            
            self.scrollView.setContentOffset(.zero, animated: true)
        }
    }
    
    @IBAction func actionMenu(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewMenu.isHidden = !self.viewMenu.isHidden
        }
    }
    
    @IBAction func actionSearch(_ sender:UIButton){
        self.txtSearch.becomeFirstResponder()
    }
    
    @IBAction func actionBottomOption(_ sender:UIButton){
        self.handleBottomAction(index: sender.tag)
    }
    
    
    @IBAction func actionMenuOptions_ (_ sender:UIButton){
        
        switch sender.tag {
        case 0:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: AboutViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
            break
        case 1:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: TrendHotTopicViewController.self, andStoryboardName: StoryBoardNames.Guest.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
            break
        case 2:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: StarPageViewController.self, andStoryboardName: StoryBoardNames.Guest.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
            break
        case 3:
//            GCD.async(.Main) {
//                let vc = UIStoryboard(name: StoryBoardNames.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier:ViewControllerNames.MainTabBar.rawValue) as! BaseTabbarController
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//            }
            
            self.openMainTabBar()
            break
        case 4:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: LoginViewController.self, andStoryboardName: StoryBoardNames.Auth.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
            break
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension MainPageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == self.tableViewPost ? 6 : 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tableViewPost{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.MainPostTableViewCell.rawValue, for: indexPath) as! MainPostTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.UserTableViewCell.rawValue, for: indexPath) as! UserTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView == self.tableViewPost ? 350 : 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView == self.tableViewUser{
            if let vc = self.instantiateVC(withDestinationViewControllerType: StarPageViewController.self, andStoryboardName: StoryBoardNames.Guest.rawValue){
                self.goTo(viewController: vc, withDisplayVCType: .push)
            }
        }
    }
}

extension MainPageViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionSlider{
            return 3
        }else{
            return collectionView == self.collectionTopHash ? 10:12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionSlider{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellNames.MainSliderCollectionViewCell.rawValue, for: indexPath) as! MainSliderCollectionViewCell
            cell.imageSlider.image = UIImage(named: "banner\(indexPath.row)")
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellNames.HashTagCollectionViewCell.rawValue, for: indexPath) as! HashTagCollectionViewCell
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionSlider{
            let width  = ScreenSize.SCREEN_WIDTH - 48
            return CGSize(width:width, height: width * 0.56)
        }else{
            return CGSize(width: 75, height: 25)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if collectionView != self.collectionSlider{
            if let vc = self.instantiateVC(withDestinationViewControllerType: SerpPageViewController.self, andStoryboardName: StoryBoardNames.Guest.rawValue){
                self.goTo(viewController: vc, withDisplayVCType: .push)
            }
        }
        
    }
    
}
