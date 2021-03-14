//
//  CountrySelectionViewController.swift
//  ClickMe
//
//  Created by Fahad on 31/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit


let COUNTRIES = ["Japan","USA","France","Germany","Italy","Russia","Portugal","Spain","Turky","Denmark","Ukraine"]

protocol CountrySelectionViewControllerDelegate:BaseSettingsViewControllerDelegate {

}
class CountrySelectionViewController: BaseViewController {

    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var btnGender: UIButton!

   var delegate:CountrySelectionViewControllerDelegate?
      
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

extension CountrySelectionViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return COUNTRIES.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.DropDownTableViewCell.rawValue, for: indexPath) as! DropDownTableViewCell
        cell.lblTitle.text = COUNTRIES[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        GCD.async(.Main) {
            self.viewMenu.isHidden = true
            self.btnGender.setTitle(COUNTRIES[indexPath.row], for: .normal)
            
        }
    }
}
