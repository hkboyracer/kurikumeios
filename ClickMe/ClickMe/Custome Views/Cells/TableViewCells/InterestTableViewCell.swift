//
//  InterestTableViewCell.swift
//  ClickMe
//
//  Created by Fahad on 05/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class InterestTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var imgCheck: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
