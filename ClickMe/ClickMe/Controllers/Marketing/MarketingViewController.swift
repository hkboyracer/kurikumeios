//
//  MarketingViewController.swift
//  ClickMe
//
//  Created by Fahad on 22/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class MarketingViewController: BaseViewController {
    @IBOutlet weak var collectionTren: UICollectionView!
    @IBOutlet weak var collectionCategory: UICollectionView!
    @IBOutlet weak var collectionBrand: UICollectionView!
    @IBOutlet weak var collectionTopTrend: UICollectionView!
    @IBOutlet weak var viewMenu: UIView!

    var indexTrend = 0
    var indexCategory = 0
    var indexBrand = 0
    
    

   
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionTren.register(UINib(nibName: CollectionViewCellNames.MarketingItemCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellNames.MarketingItemCollectionViewCell.rawValue)
        self.collectionCategory.register(UINib(nibName: CollectionViewCellNames.MarketingItemCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellNames.MarketingItemCollectionViewCell.rawValue)
        self.collectionBrand.register(UINib(nibName: CollectionViewCellNames.MarketingItemCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellNames.MarketingItemCollectionViewCell.rawValue)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
              self.viewMenu.isHidden = true

          }
    
    
    @IBAction func actionMenuPopup(_ sender:UIButton){
           GCD.async(.Main) {
               self.viewMenu.isHidden = !self.viewMenu.isHidden
           }
       }
       

    
    @IBAction func actionMenu(_ sender:UIButton){
     self.showMenu()
    }
    
    @IBAction func actionNext(_ sender:UIButton){
        var collection: UICollectionView?
        
        var index = -1
        switch sender.tag{
        case 0:
            if self.indexTrend < 5{
                self.indexTrend += 1
                index = self.indexTrend
            }
            collection = self.collectionTren
            break
        case 1:
            if self.indexCategory < 5{
                self.indexCategory += 1
                index = self.indexCategory
            }
            collection = self.collectionCategory
            break
         case 2:
            if self.indexBrand < 5{
                self.indexBrand += 1
                index = self.indexBrand
            }
            collection = self.collectionBrand
            break
        default:
            break
        }
        
        if index != -1{
            GCD.async(.Main) {
                collection!.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            }
        }

        
    }
    
    @IBAction func actionBack(_ sender:UIButton){
           var collection: UICollectionView?
             
             var index = -1
             switch sender.tag{
             case 0:
                 if self.indexTrend > 0{
                     self.indexTrend -= 1
                     index = self.indexTrend
                 }
                 collection = self.collectionTren
                 break
             case 1:
                 if self.indexCategory > 0{
                     self.indexCategory -= 1
                     index = self.indexCategory
                 }
                 collection = self.collectionCategory
                 break
              case 2:
                 if self.indexBrand > 0{
                     self.indexBrand -= 1
                     index = self.indexBrand
                 }
                 collection = self.collectionBrand
                 break
             default:
                 break
             }
             
             if index != -1{
                 GCD.async(.Main) {
                     collection!.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
                 }
             }
        
        
        
    }
    
    @IBAction func actionOptions(_ sender:UIButton){
    }

}

extension MarketingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionTopTrend{
            return 8
        }else{
        if collectionView == self.collectionTren{
            return 6
        }else if collectionView == self.collectionCategory{
            return 6
        }else{
            return 6
        }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionTopTrend{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellNames.TopTrendCollectionViewCell.rawValue, for: indexPath) as! TopTrendCollectionViewCell
                return cell
        }else{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellNames.MarketingItemCollectionViewCell.rawValue, for: indexPath) as! MarketingItemCollectionViewCell
       if collectionView == self.collectionTren{
        cell.viewInfo.isHidden = false
        }else if collectionView == self.collectionCategory{
            cell.viewInfo.isHidden = true
        }else{
            cell.viewInfo.isHidden = false
        }
        cell.configure()
        return cell
        }

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionTopTrend{
            return CGSize(width: 110, height: 40)
        }else{
        let width = (ScreenSize.SCREEN_WIDTH - 50)/2
        if collectionView == self.collectionTren{
            return CGSize(width: width, height: 200)
        }else if collectionView == self.collectionCategory{
            return CGSize(width: width, height: 135)
        }else{
            return CGSize(width: width, height: 200)
        }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        GCD.async(.Main) {
                   if let vc = self.instantiateVC(withDestinationViewControllerType: MarketingItemDetailViewController.self, andStoryboardName: StoryBoardNames.Marketing.rawValue){
                                  self.goTo(viewController: vc, withDisplayVCType: .push)
               }
        }
    }
}
