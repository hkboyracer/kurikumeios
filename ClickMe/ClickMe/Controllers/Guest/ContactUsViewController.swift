//
//  ContactUsViewController.swift
//  ClickMe
//
//  Created by Fahad on 17/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class ContactUsViewController: BaseViewController {
    @IBOutlet weak var txtMesage: UITextView!



    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtMesage.addDoneButton()
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

       @IBAction func actionSent(_ sender:UIButton){
           GCD.async(.Main) {
               if let vc = self.instantiateVC(withDestinationViewControllerType: ThankYouViewController.self, andStoryboardName: StoryBoardNames.Others.rawValue){
                              self.goTo(viewController: vc, withDisplayVCType: .push)
           }
           }
       }


}
