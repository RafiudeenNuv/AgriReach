//
//  SelectApplicationVC.swift
//  Agri Reach
//
//  Created by Kiran on 28/04/22.
//

import UIKit

class SelectApplicationVC: UIViewController {


    @IBOutlet weak var colview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colview.delegate = self
        self.colview.dataSource = self
        self.colview.showsHorizontalScrollIndicator = false
        colview.register(UINib.init(nibName: "SubcriptionPlanCell", bundle: nil), forCellWithReuseIdentifier: "SubcriptionPlanCell")
         
         let floawLayout = UPCarouselFlowLayout()
         floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: 265)
         floawLayout.scrollDirection = .vertical
         floawLayout.sideItemScale = 0.8
         floawLayout.sideItemAlpha = 0.2
         floawLayout.spacingMode = .overlap(visibleOffset: 70)
         colview.collectionViewLayout = floawLayout
        colview.reloadData()

    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.colview.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("page at centre = \(currentPage)")
        }
    }
    fileprivate var pageSize: CGSize {
        let layout = self.colview.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    @IBAction func selectQCBtn(_ sender: Any) {
        

        
        let storyboard = MainTabBarVC.instantiate(fromAppStoryboard: .QC_Home)
        navigationController?.pushViewController(storyboard, animated: true)
        

    }

    
    @IBAction func selectTradingBtn(_ sender: Any) {

        
        let storyboard = MainTabBarVC.instantiate(fromAppStoryboard: .Trading_Home)
        navigationController?.pushViewController(storyboard, animated: true)


    }
    
    @IBAction func selectListingBtn(_ sender: Any) {

        
        let storyboard = MainTabBarVC.instantiate(fromAppStoryboard: .Listing_Home)
        navigationController?.pushViewController(storyboard, animated: true)

    }
    
    
    func selectColor(view : UIView,text : UIButton){
        view.applyShadow(offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: 10)
        view.applyPrimayColor(color: UIColor.colorWithHexString("2B2F5C"))
        text.setTitleColor(.white, for: .normal)
    }

    func nonSelectColor(view : UIView,text : UIButton){
        view.applyShadow(color: UIColor.colorWithHexString("#2B2F5C"),offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: 10)
        view.applyPrimayColor(color: UIColor.white)
        text.setTitleColor(.hexStringToUIColor(hex: "2B2F5C"), for: .normal)
    }
    

}


extension SelectApplicationVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubcriptionPlanCell", for: indexPath) as! SubcriptionPlanCell

        return cell
    }
    
    
    
    
    
}
