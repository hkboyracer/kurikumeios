//
//  ThankYouViewController.swift
//  ClickMe
//
//  Created by Fahad on 17/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class ThankYouViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionPop(_ sender:UIButton){
        GCD.async(.Main) {
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func actionSent(_ sender:UIButton){
        
    }

}
