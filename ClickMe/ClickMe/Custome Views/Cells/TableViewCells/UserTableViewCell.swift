//
//  UserTableViewCell.swift
//  ClickMe
//
//  Created by Fahad on 08/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewOtherUser: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
