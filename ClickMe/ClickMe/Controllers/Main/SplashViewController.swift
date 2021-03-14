//
//  SplashViewController.swift
//  ClickMe
//
//  Created by Fahad on 05/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GCD.async(.Main, delay: 1.0) {
//            if let vc = self.instantiateVC(withDestinationViewControllerType: LoginViewController.self, andStoryboardName: StoryBoardNames.Auth.rawValue){
//                self.goTo(viewController: vc, withDisplayVCType: .push)
//            }
            
            if let vc = self.instantiateVC(withDestinationViewControllerType: MainPageViewController.self, andStoryboardName: StoryBoardNames.Guest.rawValue){
                self.goTo(viewController: vc, withDisplayVCType: .push)
            }
        }
        // Do any additional setup after loading the view.
    }

}
