//
//  AppEnums.swift
//  DevcrewTask
//
//  Created by Fahad on 20/12/2020.
//  Copyright © 2020 Fahad. All rights reserved.
//

import Foundation

enum APICodes:Int
{
    case Success
    case Failure
    var rawValue: Int {
        switch self {
        case .Success: return 200
        case .Failure: return 100
        }
    }
}
enum DisplayVCType {
    case push
    case present
}

enum StoryBoardNames:String{
    case Main
    case Auth
    case Home
    case Notification
    case Guest
    case Others
    case Profile
    case Settings
    case Marketing
    case Message
    case Search


}

enum TableViewCellNames:String{
    case InterestTableViewCell
    case SocialPostTableViewCell
    case AllNotificationTableViewCell
    case ReplyNotificationTableViewCell
    case MainPostTableViewCell
    case UserTableViewCell
    case ContentPostTableViewCell
    case ConversationTableViewCell
    case DropDownTableViewCell
    case MenuTableViewCell
    case ItemReviewTableViewCell
}

enum CollectionViewCellNames:String{
    case HashTagCollectionViewCell
    case MainSliderCollectionViewCell
    case UserCollectionViewCell
    case MarketingItemCollectionViewCell
    case TopTrendCollectionViewCell
}


enum ViewControllerNames:String{
    case SplashViewController
    case MainTabBar
    case UserNamePopupViewController
    case EmailPopupViewController
    case ProfileURLPopupViewController
    case ProfileStatementPopupViewController
    case GenderPopupViewController
    case ChangePasswordPopupViewController
    case LanguageViewController
    case CountrySelectionViewController
    case AccountVerificationPopupViewController
    case PaymentViewController
    case ChangePrivacyPopupViewController
    case DeleteAccountPopupViewController
    case SNSViewController
    case SNSAuthViewController
    case ContainerViewController
    case RightMenu
    case ContainerNVC
    case MarketingNVC
}



