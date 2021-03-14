//
//  LoginViewController.swift
//  ClickMe
//
//  Created by Fahad on 05/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var txtEmail: BaseTextFeilds!
    @IBOutlet weak var txtPassword: BaseTextFeilds!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionLogin(_ sender:UIButton){
//        GCD.async(.Main) {
//            let vc = UIStoryboard(name: StoryBoardNames.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier:ViewControllerNames.MainTabBar.rawValue) as! BaseTabbarController
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true, completion: nil)
//        }
        self.openMainTabBar()
    }
  
    @IBAction func actionPop(_ sender:UIButton){
           GCD.async(.Main) {
               
               self.navigationController?.popViewController(animated: true)
           }
       }

    @IBAction func actionSignUp(_ sender:UIButton){
        GCD.async(.Main) {
            if let vc = self.instantiateVC(withDestinationViewControllerType: SignUpViewController.self, andStoryboardName: StoryBoardNames.Auth.rawValue){
                           self.goTo(viewController: vc, withDisplayVCType: .push)
        }
        }
    }

}
