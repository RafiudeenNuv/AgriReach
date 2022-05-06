//
//  AR_Primary_Button.swift
//  Agri Reach
//
//  Created by Kiran on 05/05/22.
//

import UIKit

class AR_Primary_Button: UIButton {
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.height / 2
    }

}


class AR_Shadow_view: UIView{
    
    override func draw(_ rect: CGRect) {
        self.applyShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 5, cornorRadius: 40)
        self.layer.cornerRadius = 30

    }
    
}
