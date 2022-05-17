//
//  AR_Primary_Button.swift
//  Agri Reach
//
//  Created by Kiran on 05/05/22.
//

import UIKit

 final class AR_Primary_Button: UIButton {


    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setup()

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.applyButtonShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: self.frame.height / 2,backgroundColor : .primaryColor)

    }
}


final class AR_Shadow_view: UIView{
    
    override func draw(_ rect: CGRect) {
        self.applyShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 5, cornorRadius: 40)
        self.layer.cornerRadius = 30

    }
    
}
