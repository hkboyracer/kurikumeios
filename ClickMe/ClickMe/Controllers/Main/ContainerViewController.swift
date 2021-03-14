//
//  ContainerViewController.swift
//  ClickMe
//
//  Created by Fahad on 20/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class ContainerViewController: BaseViewController {
    @IBOutlet weak var viewContainer: UIView!
    
    var currentViewController = UIViewController()
    var previousVIewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHome()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func loadHome(withIndex index:Int = 0)  {
        GCD.async(.Main) {
            let vc = UIStoryboard(name: StoryBoardNames.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier:ViewControllerNames.MainTabBar.rawValue) as! BaseTabbarController
            vc.selectedIndex = index
            self.addChild(vc)
            self.viewContainer.addSubview(vc.view)
            vc.view.frame = self.viewContainer.bounds
            vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            vc.didMove(toParent: self)
        }
    }
    
    func add(asChildViewController viewController: UIViewController) {
        self.previousVIewController = self.currentViewController
        self.addChild(viewController)
        self.viewContainer.addSubview(viewController.view)
        viewController.view.frame = viewContainer.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
        self.currentViewController = viewController
    }
    
    func removeChild(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
}

