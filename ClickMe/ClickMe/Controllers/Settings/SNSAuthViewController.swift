//
//  SNSAuthViewController.swift
//  ClickMe
//
//  Created by Fahad on 09/02/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class SNSAuthViewController: BaseViewController {
    var delegate:ProfileURLPopupViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
         
    @IBAction func btnCheck(_ sender:UIButton){
        GCD.async(.Main) {
            sender.isSelected = !sender.isSelected
        }
    }
    
         @IBAction func actionClose(_ sender:UIButton){
                GCD.async(.Main) {
                 if let del = self.delegate{
                     del.actionClose()
                 }
                }
            }
}
