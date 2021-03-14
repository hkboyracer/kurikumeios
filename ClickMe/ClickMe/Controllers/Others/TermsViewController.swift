//
//  TermsViewController.swift
//  ClickMe
//
//  Created by Fahad on 15/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class TermsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   @IBAction func actionPop(_ sender:UIButton){
        GCD.async(.Main) {
            if let _ = self.navigationController{
                self.navigationController?.popViewController(animated: true)
            }else{
                self.showMenu()
            }
        }
    }

}
