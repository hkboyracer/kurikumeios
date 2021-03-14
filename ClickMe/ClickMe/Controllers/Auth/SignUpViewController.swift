//
//  SignUpViewController.swift
//  ClickMe
//
//  Created by Fahad on 05/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {
    @IBOutlet weak var btnCheck: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     @IBAction func actionLogin(_ sender:UIButton){
           GCD.async(.Main) {
            self.navigationController?.popViewController(animated: true)
           }
       }
    
    @IBAction func actionCheck(_ sender:UIButton){
          GCD.async(.Main) {
              sender.isSelected = !sender.isSelected
          }
      }
    
    @IBAction func actionSignUp(_ sender:UIButton){
        GCD.async(.Main) {
            if let vc = self.instantiateVC(withDestinationViewControllerType: InterestsViewController.self, andStoryboardName: StoryBoardNames.Auth.rawValue){
                self.goTo(viewController: vc, withDisplayVCType: .push)
            }
        }
    }
}
