//
//  LanguageViewController.swift
//  ClickMe
//
//  Created by Fahad on 17/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import Foundation
import UIKit

let LANGUAGES = ["日本語 (Japanese)","English","French","German","Italian","Russian","Portuguese","Portagues","Spanish","Turkish","Dutch","Ukraine"]


protocol LanguageViewControllerDelegate:BaseSettingsViewControllerDelegate {

}
class LanguageViewController: BaseViewController {

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
      @IBAction func actionClose(_ sender:UIButton){
             GCD.async(.Main) {
              if let del = self.delegate{
                  del.actionClose()
              }
             }
         }
}

extension LanguageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LANGUAGES.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.DropDownTableViewCell.rawValue, for: indexPath) as! DropDownTableViewCell
        cell.lblTitle.text = LANGUAGES[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        GCD.async(.Main) {
            self.viewMenu.isHidden = true
            self.btnGender.setTitle(LANGUAGES[indexPath.row], for: .normal)
            
        }
    }
}
