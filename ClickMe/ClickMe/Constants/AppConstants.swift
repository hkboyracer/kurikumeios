//
//  AppConstants.swift
//  DevcrewTask
//
//  Created by Fahad on 20/12/2020.
//  Copyright © 2020 Fahad. All rights reserved.
//

import Foundation
import UIKit
struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPHONE_XS_MAX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 896.0
}



struct APPMessages {
}


struct AppFonts {

}

struct AppColors {
    static let APP_GREEN_COLOR = UIColor(red: 32/255, green: 165/255, blue: 100/255, alpha: 1)
    
}

let MENU_IMAGES = [
UIImage(named: "home"),
UIImage(named: "hash"),
UIImage(named: "searchGray"),
UIImage(named: "bell"),
UIImage(named: "envlope"),
UIImage(named: "bookmark"),
UIImage(named: "bag"),
UIImage(named: "profileGray"),
UIImage(named: "settings"),
]


let MENU_TITLES = [
"ホーム",
"ホットな話題",
"検索",
"通知",
"メッセージ",
"ブックマーク",
"ショッピング",
"プロフィール",
"設定",
]
