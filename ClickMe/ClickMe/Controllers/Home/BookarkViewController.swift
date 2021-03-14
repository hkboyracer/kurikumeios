//
//  BookarkViewController.swift
//  ClickMe
//
//  Created by Fahad on 20/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

import UIKit

class BookMarkViewController: BaseViewController {
    @IBOutlet weak var tableInterests: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableInterests.register(UINib(nibName: TableViewCellNames.SocialPostTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue)
        self.tableInterests.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionMenu(_ sender:UIButton){
        self.showMenu()
    }

}
extension BookMarkViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNames.SocialPostTableViewCell.rawValue, for: indexPath) as! SocialPostTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
