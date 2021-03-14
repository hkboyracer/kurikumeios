//
//  ChatDetailViewController.swift
//  ClickMe
//
//  Created by Fahad on 07/02/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class ChatDetailViewController: BaseViewController,UITextFieldDelegate {

    @IBOutlet weak var viewMenu: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           self.viewMenu.isHidden = true

       }
    
    @IBAction func actionPop(_ sender:UIButton){
        GCD.async(.Main) {
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func actionMenu(_ sender:UIButton){
           GCD.async(.Main) {
               self.viewMenu.isHidden = !self.viewMenu.isHidden
           }
       }
       
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
