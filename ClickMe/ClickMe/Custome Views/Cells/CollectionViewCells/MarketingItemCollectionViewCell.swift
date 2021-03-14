//
//  MarketingItemCollectionViewCell.swift
//  ClickMe
//
//  Created by Fahad on 22/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class MarketingItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var widthImage: NSLayoutConstraint!
    
    
    func configure()  {
        self.widthImage.constant = (ScreenSize.SCREEN_WIDTH - 50)/2
    }

}
