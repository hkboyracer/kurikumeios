//
//  DisclaimerViewController.swift
//  ClickMe
//
//  Created by Fahad on 15/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class DisclaimerViewController: BaseViewController {

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
