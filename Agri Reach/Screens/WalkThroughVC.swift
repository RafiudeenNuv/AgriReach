//
//  WalkThroughVC.swift
//  Agri Reach
//
//  Created by Kiran on 18/04/22.
//

import UIKit

struct WalkModel{
    let imagedata : String
    let title : String
    let subtitle : String
}

class WalkThroughVC: UIViewController {

    @IBOutlet weak var pageControl: CustomPageControl!
    @IBOutlet weak var colView: UICollectionView!
    var walkModel = [WalkModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        colView.delegate = self
        colView.dataSource = self
        colView.register(UINib(nibName: "WalkThroughCell", bundle: nil), forCellWithReuseIdentifier: "WalkThroughCell")
        walkModel = [WalkModel(imagedata: "walkthrough 1", title: "Onboarding", subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit adipiscing sit enim enim id iaculis tristique. "),
                     WalkModel(imagedata: "walkthrough 2", title: "Onboarding", subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit adipiscing sit enim enim id iaculis tristique. "),
                     WalkModel(imagedata: "walkthrough 3", title: "Onboarding", subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit adipiscing sit enim enim id iaculis tristique. ")]
        pageControl.currentPage = 0
        pageControl.numberOfPages = walkModel.count
        pageControl.currentPageImage = UIImage(named: "Shape 1")
        pageControl.otherPagesImage = UIImage(named: "Shape 2")
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        
        let margin = UIScreen.main.bounds.size

        
        var cellSize1 = CGSize()
        cellSize1 = CGSize(width:margin.width , height:margin.height)
   

        let layout1 = UICollectionViewFlowLayout()
        layout1.scrollDirection = .horizontal //.horizontal
        layout1.itemSize = cellSize1
        layout1.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout1.minimumLineSpacing = 0
        layout1.minimumInteritemSpacing = 0
        colView.setCollectionViewLayout(layout1, animated: true)
        colView.reloadData()

    }
    
    @IBAction func skip(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func next(_ sender: Any){
        let visibleItems: NSArray = self.colView.indexPathsForVisibleItems as NSArray
            let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
            let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
                   if nextItem.row < walkModel.count {
                self.colView.scrollToItem(at: nextItem, at: .left, animated: true)
                    pageControl.currentPage = nextItem.row


            }
    }
    
   

}


extension WalkThroughVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.walkModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalkThroughCell", for: indexPath) as! WalkThroughCell
        let index = self.walkModel[indexPath.row]
        cell.imageView.image = UIImage(named: index.imagedata)
        cell.titleTxt.text = index.title
        cell.subTitleTxt.text = index.subtitle
        
        return cell
    }
    
    
    
    
    
}


class CustomPageControl: UIPageControl {

@IBInspectable var currentPageImage: UIImage?

@IBInspectable var otherPagesImage: UIImage?

override var numberOfPages: Int {
    didSet {
        updateDots()
    }
}

override var currentPage: Int {
    didSet {
        updateDots()
    }
}

override func awakeFromNib() {
    super.awakeFromNib()
    if #available(iOS 14.0, *) {
        defaultConfigurationForiOS14AndAbove()
        pageIndicatorTintColor = .clear
        currentPageIndicatorTintColor = .clear
        clipsToBounds = false


    } else {
        pageIndicatorTintColor = .clear
        currentPageIndicatorTintColor = .clear
        clipsToBounds = false

    }
}

private func defaultConfigurationForiOS14AndAbove() {
    if #available(iOS 14.0, *) {
        for index in 0..<numberOfPages {
            let image = index == currentPage ? currentPageImage : otherPagesImage
            setIndicatorImage(image, forPage: index)
        }

        // give the same color as "otherPagesImage" color.
        
        // give the same color as "currentPageImage" color.
        /*
         Note: If Tint color set to default, Indicator image is not showing. So, give the same tint color based on your Custome Image.
        */
    }
}

private func updateDots() {
    if #available(iOS 14.0, *) {
        defaultConfigurationForiOS14AndAbove()
    } else {
        for (index, subview) in subviews.enumerated() {
            let imageView: UIImageView
            if let existingImageview = getImageView(forSubview: subview) {
                imageView = existingImageview
            } else {
                imageView = UIImageView(image: otherPagesImage)
                
                imageView.center = subview.center
                subview.addSubview(imageView)
                subview.clipsToBounds = false
            }
            imageView.image = currentPage == index ? currentPageImage : otherPagesImage
        }
    }
}

private func getImageView(forSubview view: UIView) -> UIImageView? {
    if let imageView = view as? UIImageView {
        return imageView
    } else {
        let view = view.subviews.first { (view) -> Bool in
            return view is UIImageView
        } as? UIImageView

        return view
    }
}
}
