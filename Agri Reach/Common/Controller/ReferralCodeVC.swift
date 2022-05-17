//
//  ReferralCodeVC.swift
//  Agri Reach
//
//  Created by Kiran on 06/05/22.
//

import UIKit

class ReferralCodeVC: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var referralCodeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.referralCodeView.applyShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 10, cornorRadius: self.referralCodeView.frame.height / 2)
        
        self.submitBtn.applyButtonShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: self.submitBtn.frame.height / 2)


    }
    
    
    @IBAction func submitBtn(_ sender: Any) {
        AppDelegate.shared.overrideApplicationThemeStyle()

    }
    
    

}
