//
//  AR-Extension.swift
//  Agri Reach
//
//  Created by Kiran on 05/05/22.
//

import UIKit

extension UIButton{
    
    func applyButtonShadow(color: UIColor = .clear, opacity: Float = 0.2, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true,cornorRadius : CGFloat, backgroundColor : UIColor = .white) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.cornerRadius = cornorRadius
        layer.backgroundColor = backgroundColor.cgColor

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
    
}
