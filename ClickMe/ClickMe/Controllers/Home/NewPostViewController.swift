//
//  NewPostViewController.swift
//  ClickMe
//
//  Created by Fahad on 30/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class NewPostViewController: BaseViewController {
    @IBOutlet weak var txtPost: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtPost.addDoneButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionPop(_ sender:UIButton){
        GCD.async(.Main) {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
