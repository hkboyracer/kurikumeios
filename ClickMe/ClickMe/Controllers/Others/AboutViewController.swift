//
//  AboutViewController.swift
//  ClickMe
//
//  Created by Fahad on 13/01/2021.
//  Copyright © 2021 Fahad. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {

       @IBOutlet weak var scrollView: UIScrollView!
       @IBOutlet weak var viewMenu: UIView!
       @IBOutlet weak var collectionSlider: UICollectionView!
       @IBOutlet weak var heightScroll: NSLayoutConstraint!
       @IBOutlet weak var txtSearch: BaseTextFeilds!

       var currentSliderIndex = 0
       override func viewDidLoad() {
           super.viewDidLoad()
           self.configure()
           // Do any additional setup after loading the view.
       }
       

       func configure() {
              self.collectionSlider.register(UINib(nibName: CollectionViewCellNames.MainSliderCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellNames.MainSliderCollectionViewCell.rawValue)
           
       }
    
   @IBAction func actionPop(_ sender:UIButton){
        GCD.async(.Main) {
            if let _ = self.navigationController{
                self.navigationController?.popViewController(animated: true)
            }else{
                self.showMenu()
            }
        }
    }
    
    @IBAction func actionSearch(_ sender:UIButton){
        self.txtSearch.becomeFirstResponder()
    }
    @IBAction func actionNextImage(_ sender:UIButton){
        self.currentSliderIndex += self.currentSliderIndex < 2  ? 1 : 0
        self.scrollSliderToIndex()
    }
    
    @IBAction func actionPrevImage(_ sender:UIButton){
            self.currentSliderIndex -= self.currentSliderIndex > 0 ? 1 : 0
        self.scrollSliderToIndex()
    }
    
    func scrollSliderToIndex() {
        GCD.async(.Main) {
            self.collectionSlider.scrollToItem(at: IndexPath(row: self.currentSliderIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }

}
extension AboutViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellNames.MainSliderCollectionViewCell.rawValue, for: indexPath) as! MainSliderCollectionViewCell
            cell.imageSlider.image = UIImage(named: "banner\(indexPath.row)")
            return cell
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width  = ScreenSize.SCREEN_WIDTH - 48
            return CGSize(width:width, height: width * 0.56)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
}
