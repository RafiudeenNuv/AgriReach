//
//  VerificationVC.swift
//  Agri Reach
//
//  Created by Kiran on 05/05/22.
//

import UIKit

class VerificationVC: UIViewController {

    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    
    @IBOutlet weak var signinBtn: R_UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.v1.otpView()
        self.v2.otpView()
        self.v3.otpView()
        self.v4.otpView()
        
        self.signinBtn.applyButtonShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: self.signinBtn.frame.height / 2)
        
        
        let storyboard = LocationEnableVC.instantiate(fromAppStoryboard: .Authentication)
        storyboard.modalPresentationStyle = .overCurrentContext
        navigationController?.present(storyboard, animated: true, completion: {
            
        })

    }

}
