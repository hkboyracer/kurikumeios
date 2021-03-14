//
//  PaymentViewController.swift
//  ClickMe
//
//  Created by Fahad on 30/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

protocol PaymentViewControllerDelegate:BaseSettingsViewControllerDelegate {

}
class PaymentViewController: BaseViewController {

    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var btnGender: UIButton!

   var delegate:PaymentViewControllerDelegate?
      
      override func viewDidLoad() {
          super.viewDidLoad()
        self.viewMenu.isHidden = true
      }
      @IBAction func actionClose(_ sender:UIButton){
             GCD.async(.Main) {
              if let del = self.delegate{
                  del.actionClose()
              }
             }
         }
}
