//
//  ContentPostTableViewCell.swift
//  ClickMe
//
//  Created by Fahad on 12/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class ContentPostTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
