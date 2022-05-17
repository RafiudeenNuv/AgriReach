//
//  AadharOtpVerificationVC.swift
//  Agri Reach
//
//  Created by Kiran on 10/05/22.
//

import UIKit

class AadharOtpVerificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func verificaionBtn(_ sender: Any) {
        let storyboard = AadhaarVerificationSuccessVC.instantiate(fromAppStoryboard: .AadhaarVerification)
        storyboard.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(storyboard, animated: true)
    }
    

}
