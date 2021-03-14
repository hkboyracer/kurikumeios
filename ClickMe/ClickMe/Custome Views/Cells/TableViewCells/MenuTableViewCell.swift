//
//  MenuTableViewCell.swift
//  ClickMe
//
//  Created by Fahad on 19/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
        @IBOutlet weak var lblTitle: UILabel!
        @IBOutlet weak var imgIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(index:Int) {
        self.lblTitle.text = MENU_TITLES[index]
        self.imgIcon.image = MENU_IMAGES[index]
    }

}
