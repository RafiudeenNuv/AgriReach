//
//  AR-Extension+View.swift
//  Agri Reach
//
//  Created by Kiran on 26/04/22.
//

import UIKit

extension UIView {
    
    func applyCornerRadius(backgrround : UIColor = .white , cornerRadius : CGFloat? = nil, borderColor : UIColor? = nil , borderWidth : CGFloat? = nil) {
        
        //For button corner radius
        if cornerRadius != nil {
            self.layer.cornerRadius = cornerRadius!
        }
        else {
            self.layer.cornerRadius = 0
        }
        self.layer.backgroundColor = backgrround.cgColor
        //For Border color
        if borderColor != nil {
            self.layer.borderColor = borderColor?.cgColor
        } else {
            self.layer.borderColor = UIColor.clear.cgColor
        }
        
        //For button border width
        if borderWidth != nil {
            self.layer.borderWidth = borderWidth!
        }
        else {
            self.layer.borderWidth = 0
        }
    }
    
    
    func applyShadow(color: UIColor = .clear, opacity: Float = 0.2, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true,cornorRadius : CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.cornerRadius = cornorRadius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }

    func applyPrimayColor(color: UIColor){
        layer.backgroundColor = color.cgColor
    }
    
    func unSelectLanguageView(languageTxt : UILabel){
        languageTxt.textColor = .black
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = self.layer.frame.height / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func selectLanguageView(languageTxt : UILabel){
        languageTxt.textColor = .white
        layer.backgroundColor = UIColor.primaryColor.cgColor
        layer.cornerRadius = self.layer.frame.height / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryColor.cgColor
        
    }
    
    func otpView(){
        self.applyShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 5, cornorRadius: 10)
    }
}
