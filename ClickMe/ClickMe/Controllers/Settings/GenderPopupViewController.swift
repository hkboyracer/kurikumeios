//
//  GenderPopupViewController.swift
//  ClickMe
//
//  Created by Fahad on 17/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

protocol GenderPopupViewControllerDelegate:BaseSettingsViewControllerDelegate {

}
class GenderPopupViewController: BaseViewController {

    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var btnGender: UIButton!

   var delegate:GenderPopupViewControllerDelegate?
      
      override func viewDidLoad() {
          super.viewDidLoad()
        self.viewMenu.isHidden = true
      }
    @IBAction func actionShowMenu(_ sender:UIButton){
        GCD.async(.Main) {
                self.viewMenu.isHidden = !self.viewMenu.isHidden
        }
    }
    @IBAction func actionTab(_ sender:UIButton){
           GCD.async(.Main) {
                   self.viewMenu.isHidden = true
            self.btnGender.setTitle(sender.titleLabel?.text, for: .normal)
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

