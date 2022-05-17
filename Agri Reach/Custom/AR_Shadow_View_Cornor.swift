//
//  AR_Shadow_View_Cornor.swift
//  Agri Reach
//
//  Created by Kiran on 10/05/22.
//

import UIKit

final class AR_Shadow_View_Cornor: UIView {

        override init(frame: CGRect) {
               super.init(frame: frame)
               commonInit()
           }
           
           required init?(coder aDecoder: NSCoder) {
               super.init(coder: aDecoder)
               commonInit()
           }
           
           func commonInit() {
            self.applyShadow(color: UIColor.lightGray , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius:10,borderWidth : 1 , borderColor : .lightGray)
            
           }

    }
