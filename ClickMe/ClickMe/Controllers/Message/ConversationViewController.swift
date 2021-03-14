//
//  ConversationViewController.swift
//  ClickMe
//
//  Created by Fahad on 15/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class ConversationViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: TableViewCellNames.ConversationTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.ConversationTableViewCell.rawValue)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionMenu(_ sender:UIButton){
     self.showMenu()
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
extension ConversationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.ConversationTableViewCell.rawValue, for: indexPath) as! ConversationTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        GCD.async(.Main) {
            if let vc = self.instantiateVC(withDestinationViewControllerType: ChatDetailViewController.self, andStoryboardName: StoryBoardNames.Message.rawValue){
                self.goTo(viewController: vc, withDisplayVCType: .push)
            }
        }
    }
}
