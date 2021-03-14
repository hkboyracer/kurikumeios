//
//  SettingsViewController.swift
//  ClickMe
//
//  Created by Fahad on 17/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit
import CustomIOSAlertView

protocol BaseSettingsViewControllerDelegate:NSObjectProtocol {
    func actionClose()
}


class SettingsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionMenu(_ sender:UIButton){
           self.showMenu()
    }
    
    @IBAction func actionPop(_ sender:UIButton){
           GCD.async(.Main) {
            self.navigationController?.popViewController(animated: true)
           }
       }
       
    @IBAction func actionTab(_ sender:UIButton){
        GCD.async(.Main) {
            switch sender.tag {
            case 0:
                self.createUserNamePopup()
                self.alertView?.show()
                break
            case 1:
                self.createEmailPopup()
                self.alertView?.show()
                break
            case 2:
                self.createProfileURLPopup()
                self.alertView?.show()
                break
            case 3:
                self.createProfileStatementsPopup()
                self.alertView?.show()
                break
            case 4:
                self.createGenderPopup()
                self.alertView?.show()
                break
             case 5:
                self.createChangePasswordPopup()
                self.alertView?.show()
                break
             case 6:
                self.createLanguagePopup()
                self.alertView?.show()
                break
            case 7:
                self.createCountryPopup()
                self.alertView?.show()
                break
            case 8:
                self.createAccountVerificationPopup()
                self.alertView?.show()
                break
            case 9:
                self.createSNSPopup()
                self.alertView?.show()
                break
            case 10:
                self.createPaymetPopup()
                self.alertView?.show()
                break
            case 11:
                self.createChangePrivacyPopup()
                self.alertView?.show()
                break
            case 12:
                self.createDeletePopup()
                self.alertView?.show()
                break
             case 13:
                self.createSNSAuthPopup()
                self.alertView?.show()
                break
            default:
                break
            }
            
        }
    }
    
}

extension SettingsViewController:UserNamePopupViewControllerDelegate,EmailPopupViewControllerDelegate,ProfileURLPopupViewControllerDelegate,BaseSettingsViewControllerDelegate,ProfileStatementPopupViewControllerDelegate,GenderPopupViewControllerDelegate,ChangePasswordPopupViewControllerDelegate,AccountVerificationPopupViewControllerDelegate,PaymentViewControllerDelegate,CountrySelectionViewControllerDelegate{
    func actionClose() {
        GCD.async(.Main) {
            self.alertView?.close()
        }
    }
    
    func createUserNamePopup()
      {
          self.alertView = CustomIOSAlertView()
          self.alertView?.buttonTitles = nil
          self.alertView?.useMotionEffects = true
          var demoView:UIView!
          demoView = UIView()
          if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.UserNamePopupViewController.rawValue) as? UserNamePopupViewController
          {
              self.objAlertVC = vc
              vc.delegate = self
            
              let width = Int(ScreenSize.SCREEN_WIDTH - 48)
                let totalHeight = 405
              if DeviceType.IS_IPHONE_5
              {
                  demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                  vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
              }
              else
              {
                  demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                  vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
              }
                vc.view.cornerRadiusV = 10
                vc.view.clipsToBounds = true
              demoView.addSubview(vc.view)
           //   demoView.backgroundColor = UIColor.white
              self.alertView?.containerView = demoView
         //     self.alertView?.containerView.backgroundColor = UIColor.white
              self.alertView?.isMultipleTouchEnabled = false
          }
      }
    
    func createEmailPopup()
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.EmailPopupViewController.rawValue) as? EmailPopupViewController
        {
            self.objAlertVC = vc
            vc.delegate = self
          
            let width = Int(ScreenSize.SCREEN_WIDTH - 48)
              let totalHeight = 290
            if DeviceType.IS_IPHONE_5
            {
                demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
            }
            else
            {
                demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
            }
              vc.view.cornerRadiusV = 10
              vc.view.clipsToBounds = true
            demoView.addSubview(vc.view)
            //demoView.backgroundColor = UIColor.white
            self.alertView?.containerView = demoView
         //   self.alertView?.containerView.backgroundColor = UIColor.white
            self.alertView?.isMultipleTouchEnabled = false
        }
    }
    
    func createProfileURLPopup()
       {
           self.alertView = CustomIOSAlertView()
           self.alertView?.buttonTitles = nil
           self.alertView?.useMotionEffects = true
           var demoView:UIView!
           demoView = UIView()
           if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.ProfileURLPopupViewController.rawValue) as? ProfileURLPopupViewController
           {
               self.objAlertVC = vc
               vc.delegate = self
             
               let width = Int(ScreenSize.SCREEN_WIDTH - 48)
                 let totalHeight = 290
               if DeviceType.IS_IPHONE_5
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
               }
               else
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
               }
                 vc.view.cornerRadiusV = 10
                 vc.view.clipsToBounds = true
               demoView.addSubview(vc.view)
               self.alertView?.containerView = demoView
               self.alertView?.isMultipleTouchEnabled = false
           }
       }
    
    func createProfileStatementsPopup()
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.ProfileStatementPopupViewController.rawValue) as? ProfileStatementPopupViewController
        {
            self.objAlertVC = vc
            vc.delegate = self
          
            let width = Int(ScreenSize.SCREEN_WIDTH - 48)
              let totalHeight = 380
            if DeviceType.IS_IPHONE_5
            {
                demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
            }
            else
            {
                demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
            }
              vc.view.cornerRadiusV = 10
              vc.view.clipsToBounds = true
            demoView.addSubview(vc.view)
            self.alertView?.containerView = demoView
            self.alertView?.isMultipleTouchEnabled = false
        }
    }
    
    func createGenderPopup()
       {
           self.alertView = CustomIOSAlertView()
           self.alertView?.buttonTitles = nil
           self.alertView?.useMotionEffects = true
           var demoView:UIView!
           demoView = UIView()
           if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.GenderPopupViewController.rawValue) as? GenderPopupViewController
           {
               self.objAlertVC = vc
               vc.delegate = self
             
               let width = Int(ScreenSize.SCREEN_WIDTH - 48)
                 let totalHeight = 300
               if DeviceType.IS_IPHONE_5
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
               }
               else
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
               }
                 vc.view.cornerRadiusV = 10
                 vc.view.clipsToBounds = true
               demoView.addSubview(vc.view)
               self.alertView?.containerView = demoView
               self.alertView?.isMultipleTouchEnabled = false
           }
       }
    
    
    func createChangePasswordPopup()
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.ChangePasswordPopupViewController.rawValue) as? ChangePasswordPopupViewController
        {
            self.objAlertVC = vc
            vc.delegate = self
          
            let width = Int(ScreenSize.SCREEN_WIDTH - 48)
              let totalHeight = 450
            if DeviceType.IS_IPHONE_5
            {
                demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
            }
            else
            {
                demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
            }
              vc.view.cornerRadiusV = 10
              vc.view.clipsToBounds = true
            demoView.addSubview(vc.view)
            self.alertView?.containerView = demoView
            self.alertView?.isMultipleTouchEnabled = false
        }
    }
    
    func createLanguagePopup()
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.LanguageViewController.rawValue) as? LanguageViewController
        {
            self.objAlertVC = vc
            vc.delegate = self
          
            let width = Int(ScreenSize.SCREEN_WIDTH - 48)
              let totalHeight = 310
            if DeviceType.IS_IPHONE_5
            {
                demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
            }
            else
            {
                demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
            }
              vc.view.cornerRadiusV = 10
              vc.view.clipsToBounds = true
            demoView.addSubview(vc.view)
            self.alertView?.containerView = demoView
            self.alertView?.isMultipleTouchEnabled = false
        }
    }
    
    func createCountryPopup()
       {
           self.alertView = CustomIOSAlertView()
           self.alertView?.buttonTitles = nil
           self.alertView?.useMotionEffects = true
           var demoView:UIView!
           demoView = UIView()
           if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.CountrySelectionViewController.rawValue) as? CountrySelectionViewController
           {
               self.objAlertVC = vc
               vc.delegate = self
             
               let width = Int(ScreenSize.SCREEN_WIDTH - 48)
                 let totalHeight = 310
               if DeviceType.IS_IPHONE_5
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
               }
               else
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
               }
                 vc.view.cornerRadiusV = 10
                 vc.view.clipsToBounds = true
               demoView.addSubview(vc.view)
               self.alertView?.containerView = demoView
               self.alertView?.isMultipleTouchEnabled = false
           }
       }
       
    
    func createAccountVerificationPopup()
       {
           self.alertView = CustomIOSAlertView()
           self.alertView?.buttonTitles = nil
           self.alertView?.useMotionEffects = true
           var demoView:UIView!
           demoView = UIView()
           if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.AccountVerificationPopupViewController.rawValue) as? AccountVerificationPopupViewController
           {
               self.objAlertVC = vc
               vc.delegate = self
             
               let width = Int(ScreenSize.SCREEN_WIDTH - 48)
                 let totalHeight = 620
               if DeviceType.IS_IPHONE_5
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
               }
               else
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
               }
                 vc.view.cornerRadiusV = 10
                 vc.view.clipsToBounds = true
               demoView.addSubview(vc.view)
               self.alertView?.containerView = demoView
               self.alertView?.isMultipleTouchEnabled = false
           }
       }
    
    func createSNSPopup()
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.SNSViewController.rawValue) as? SNSViewController
        {
            self.objAlertVC = vc
            vc.delegate = self
          
            let width = Int(ScreenSize.SCREEN_WIDTH - 48)
              let totalHeight = 370
            if DeviceType.IS_IPHONE_5
            {
                demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
            }
            else
            {
                demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
            }
              vc.view.cornerRadiusV = 10
              vc.view.clipsToBounds = true
            demoView.addSubview(vc.view)
            self.alertView?.containerView = demoView
            self.alertView?.isMultipleTouchEnabled = false
        }
    }
    
    func createPaymetPopup()
       {
           self.alertView = CustomIOSAlertView()
           self.alertView?.buttonTitles = nil
           self.alertView?.useMotionEffects = true
           var demoView:UIView!
           demoView = UIView()
           if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.PaymentViewController.rawValue) as? PaymentViewController
           {
               self.objAlertVC = vc
               vc.delegate = self
             
               let width = Int(ScreenSize.SCREEN_WIDTH - 48)
                 let totalHeight = 540
               if DeviceType.IS_IPHONE_5
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
               }
               else
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
               }
                 vc.view.cornerRadiusV = 10
                 vc.view.clipsToBounds = true
               demoView.addSubview(vc.view)
               self.alertView?.containerView = demoView
               self.alertView?.isMultipleTouchEnabled = false
           }
       }
    
    
    func createChangePrivacyPopup()
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.ChangePrivacyPopupViewController.rawValue) as? ChangePrivacyPopupViewController
        {
            self.objAlertVC = vc
            vc.delegate = self
          
            let width = Int(ScreenSize.SCREEN_WIDTH - 48)
              let totalHeight = 420
            if DeviceType.IS_IPHONE_5
            {
                demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
            }
            else
            {
                demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
            }
              vc.view.cornerRadiusV = 10
              vc.view.clipsToBounds = true
            demoView.addSubview(vc.view)
            self.alertView?.containerView = demoView
            self.alertView?.isMultipleTouchEnabled = false
        }
    }
    
    func createDeletePopup()
       {
           self.alertView = CustomIOSAlertView()
           self.alertView?.buttonTitles = nil
           self.alertView?.useMotionEffects = true
           var demoView:UIView!
           demoView = UIView()
           if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.DeleteAccountPopupViewController.rawValue) as? DeleteAccountPopupViewController
           {
               self.objAlertVC = vc
               vc.delegate = self
             
               let width = Int(ScreenSize.SCREEN_WIDTH - 48)
                 let totalHeight = 355
               if DeviceType.IS_IPHONE_5
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
               }
               else
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
               }
                 vc.view.cornerRadiusV = 10
                 vc.view.clipsToBounds = true
               demoView.addSubview(vc.view)
               self.alertView?.containerView = demoView
               self.alertView?.isMultipleTouchEnabled = false
           }
       }
    
    func createSNSAuthPopup()
       {
           self.alertView = CustomIOSAlertView()
           self.alertView?.buttonTitles = nil
           self.alertView?.useMotionEffects = true
           var demoView:UIView!
           demoView = UIView()
           if  let vc = UIStoryboard.init(name: StoryBoardNames.Settings.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerNames.SNSAuthViewController.rawValue) as? SNSAuthViewController
           {
               self.objAlertVC = vc
               vc.delegate = self
             
               let width = Int(ScreenSize.SCREEN_WIDTH - 48)
                 let totalHeight = 420
               if DeviceType.IS_IPHONE_5
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width: 300, height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: 300,height: totalHeight );
               }
               else
               {
                   demoView.frame = CGRect(x: 0 , y: 0, width:width , height: totalHeight)
                   vc.view.frame = CGRect(x: 0, y: 0, width: width,height: totalHeight);
               }
                 vc.view.cornerRadiusV = 10
                 vc.view.clipsToBounds = true
               demoView.addSubview(vc.view)
               self.alertView?.containerView = demoView
               self.alertView?.isMultipleTouchEnabled = false
           }
       }
    
    
    
    
}
