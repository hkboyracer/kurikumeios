//
//  ChangePrivacyPopupViewController.swift
//  ClickMe
//
//  Created by Fahad on 17/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

protocol ChangePrivacyPopupViewControllerDelegate:BaseSettingsViewControllerDelegate {
    
}
class ChangePrivacyPopupViewController: BaseViewController {
    
    @IBOutlet weak var viewMenuScope: UIView!
    @IBOutlet weak var btnScope: UIButton!
    
    @IBOutlet weak var viewMenuDirect: UIView!
    @IBOutlet weak var btnDirect: UIButton!
    
    @IBOutlet weak var viewMenuSearch: UIView!
    @IBOutlet weak var btnSearch: UIButton!
    
    var delegate:GenderPopupViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewMenuScope.isHidden = true
        self.viewMenuDirect.isHidden = true
        self.viewMenuSearch.isHidden = true
    }
    @IBAction func actionShowMenuScope(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewMenuScope.isHidden = !self.viewMenuScope.isHidden
        }
    }
    @IBAction func actionTabScope(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewMenuScope.isHidden = true
            self.btnScope.setTitle(sender.titleLabel?.text, for: .normal)
        }
    }
    
    
    @IBAction func actionShowMenuDirect(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewMenuDirect.isHidden = !self.viewMenuDirect.isHidden
        }
    }
    @IBAction func actionTabDirect(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewMenuDirect.isHidden = true
            self.btnDirect.setTitle(sender.titleLabel?.text, for: .normal)
        }
    }
    
    @IBAction func actionShowMenuSearch(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewMenuSearch.isHidden = !self.viewMenuSearch.isHidden
        }
    }
    @IBAction func actionTabSearch(_ sender:UIButton){
        GCD.async(.Main) {
            self.viewMenuSearch.isHidden = true
            self.btnSearch.setTitle(sender.titleLabel?.text, for: .normal)
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
