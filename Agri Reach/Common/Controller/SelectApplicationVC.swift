//
//  SelectApplicationVC.swift
//  Agri Reach
//
//  Created by Kiran on 28/04/22.
//

import UIKit

class SelectApplicationVC: UIViewController {

    @IBOutlet weak var listingView: UIView!
    @IBOutlet weak var tradingView: UIView!
    @IBOutlet weak var QCView: UIView!
    
    @IBOutlet weak var selectListingBtn: UIButton!
    @IBOutlet weak var selectTradingBtn: UIButton!
    @IBOutlet weak var selectQCBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.QCView.applyShadow(color: UIColor.colorWithHexString("#2B2F5C") , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: 10)
        self.tradingView.applyShadow(color: UIColor.colorWithHexString("#2B2F5C") , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: 10)
        self.listingView.applyShadow(color: UIColor.colorWithHexString("#2B2F5C") , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: 10)
    }
    
    @IBAction func selectQCBtn(_ sender: Any) {
        
        self.selectColor(view: self.QCView, text: self.selectQCBtn)
        self.nonSelectColor(view: self.tradingView, text: self.selectTradingBtn)
        self.nonSelectColor(view: self.listingView, text: self.selectListingBtn)
        
        let storyboard = MainTabBarVC.instantiate(fromAppStoryboard: .QC_Home)
        navigationController?.pushViewController(storyboard, animated: true)
        

    }

    
    @IBAction func selectTradingBtn(_ sender: Any) {
        self.selectColor(view: self.tradingView, text: self.selectTradingBtn)
        self.nonSelectColor(view: self.QCView, text: self.selectQCBtn)
        self.nonSelectColor(view: self.listingView, text: self.selectListingBtn)
        
        let storyboard = MainTabBarVC.instantiate(fromAppStoryboard: .Trading_Home)
        navigationController?.pushViewController(storyboard, animated: true)


    }
    
    @IBAction func selectListingBtn(_ sender: Any) {
        self.nonSelectColor(view: self.tradingView, text: self.selectTradingBtn)
        self.nonSelectColor(view: self.QCView, text: self.selectQCBtn)
        self.selectColor(view: self.listingView, text: self.selectListingBtn)
        
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
