//
//  StarPageViewController.swift
//  ClickMe
//
//  Created by Fahad on 12/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class StarPageViewController: UIViewController {

        @IBOutlet weak var scrollView: UIScrollView!
        @IBOutlet weak var collectionStar: UICollectionView!
        @IBOutlet weak var heightScroll: NSLayoutConstraint!
        @IBOutlet weak var heightCollectionViewStar: NSLayoutConstraint!
    
     override func viewDidLoad() {
          super.viewDidLoad()
          self.configure()
          // Do any additional setup after loading the view.
      }
      
      
      func configure() {
          self.setScrollViewHeight()
           self.collectionStar.register(UINib(nibName: CollectionViewCellNames.UserCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellNames.UserCollectionViewCell.rawValue)
      }
      
      func setScrollViewHeight(){
          
          let constant:CGFloat = 350
        self.heightCollectionViewStar.constant = CGFloat(Double(11/2.0).rounded() * 185) + 40
          self.heightScroll.constant = self.heightCollectionViewStar.constant + constant
          
      }
      
      @IBAction func actionPop(_ sender:UIButton){
          GCD.async(.Main) {
              
              self.navigationController?.popViewController(animated: true)
          }
      }

      @IBAction func actionTop(_ sender:UIButton){
             GCD.async(.Main) {
                 
                 self.scrollView.setContentOffset(.zero, animated: true)
             }
         }
}


extension StarPageViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return  11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellNames.UserCollectionViewCell.rawValue, for: indexPath) as! UserCollectionViewCell
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (ScreenSize.SCREEN_WIDTH - 84 - 40)
            return CGSize(width: width, height: 185)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        }
}
