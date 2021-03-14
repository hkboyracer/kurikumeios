//
//  UserNamePopupViewController.swift
//  ClickMe
//
//  Created by Fahad on 17/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit
protocol UserNamePopupViewControllerDelegate:BaseSettingsViewControllerDelegate {

}

class UserNamePopupViewController: BaseViewController {
    
    var delegate:UserNamePopupViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func actionClose(_ sender:UIButton){
           GCD.async(.Main) {
            if let del = self.delegate{
                del.actionClose()
            }
           }
       }
}
