//
//  BaseViewController.swift
//  DevcrewTask
//
//  Created by Fahad on 20/12/2020.
//  Copyright © 2020 Fahad. All rights reserved.
//

import UIKit
import  Foundation
import CustomIOSAlertView
import SideMenu
extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    var snapshot: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: false)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}


class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    var objAlertVC:BaseViewController?
    var alertView = CustomIOSAlertView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
    }
    
    override open func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("memory warning received-- clearing")
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    public func instantiateVC<T>(withDestinationViewControllerType vcType: T.Type,
                                 andStoryboardName sbName: String = StoryBoardNames.Main.rawValue) -> T? where T: UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: sbName, bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: String(describing: vcType.self))
        return destinationVC as? T
    }
    public func goTo(viewController destinationVC: UIViewController,
                     withDisplayVCType type: DisplayVCType = .push,
                     andModalPresentationStyle style: UIModalPresentationStyle = .popover) {
        switch type {
        case .push:
            self.navigationController?.pushViewController(destinationVC, animated: true)
        case .present:
            destinationVC.modalPresentationStyle = .fullScreen
            self.present(destinationVC, animated: true, completion: nil)
        }
    }
    
    func showMenu()  {
        let menu = UIStoryboard.init(name: StoryBoardNames.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.RightMenu.rawValue) as! SideMenuNavigationController
        menu.menuWidth = ScreenSize.SCREEN_WIDTH * 0.8
        menu.presentationStyle = .menuSlideIn
        self.present(menu, animated: true, completion: nil)
    }
    
    func handleMenuTap(index:Int)  {
        switch index {
        case 0:
            GCD.async(.Main) {
                if let container = Global.shared.mainContainerView as? ContainerViewController{
                    container.removeChild(asChildViewController: container.previousVIewController)
                    container.loadHome()
                }
            }
            break
        case 1:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: UserHotTopicViewController.self, andStoryboardName: StoryBoardNames.Home.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
        case 2:
            GCD.async(.Main) {
                if let container = Global.shared.mainContainerView as? ContainerViewController{
                    container.removeChild(asChildViewController: container.previousVIewController)
                    container.loadHome(withIndex: 1)
                }
            }
            break
        case 3:
            GCD.async(.Main) {
                if let container = Global.shared.mainContainerView as? ContainerViewController{
                    container.removeChild(asChildViewController: container.previousVIewController)
                    container.loadHome(withIndex: 2)
                }
            }
            break
            
        case 4:
            GCD.async(.Main) {
                if let container = Global.shared.mainContainerView as? ContainerViewController{
                    container.removeChild(asChildViewController: container.previousVIewController)
                    container.loadHome(withIndex: 3)
                }
            }
            break
        case 5:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: BookMarkViewController.self, andStoryboardName: StoryBoardNames.Home.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
        case 6:
            GCD.async(.Main) {
                if let vc = UIStoryboard.init(name: StoryBoardNames.Marketing.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.MarketingNVC.rawValue) as? BaseNavigationController{
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
        case 7:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: ProfileViewViewController.self, andStoryboardName: StoryBoardNames.Profile.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
        case 8:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: SettingsViewController.self, andStoryboardName: StoryBoardNames.Settings.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
        case 9:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: AboutViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
         case 10:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: ContactUsViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
            
            case 11:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: DisclaimerViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
            
            case 12:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: PrivacyViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
            
            case 13:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: TermsViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    if let container = Global.shared.mainContainerView as? ContainerViewController{
                        container.removeChild(asChildViewController: container.previousVIewController)
                        container.add(asChildViewController: vc)
                    }
                }
            }
            break
        default:
            break
        }
    }
    
    func handleBottomAction(index:Int) {
        
        switch index {
        case 0:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: AboutViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
            break
        case 1:
            GCD.async(.Main) {
                           if let vc = self.instantiateVC(withDestinationViewControllerType: ContactUsViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                               self.goTo(viewController: vc, withDisplayVCType: .push)
                           }
                       }
            break
        case 2:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: DisclaimerViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
            break
        case 3:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: PrivacyViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
            break
        case 4:
            GCD.async(.Main) {
                if let vc = self.instantiateVC(withDestinationViewControllerType: TermsViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                    self.goTo(viewController: vc, withDisplayVCType: .push)
                }
            }
            break
        default:
            break
        }
        
    }
    
    func openMainTabBar()  {
        GCD.async(.Main) {
            let vc = UIStoryboard(name: StoryBoardNames.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier:ViewControllerNames.ContainerViewController.rawValue) as! ContainerViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}
