//
//  ARUIButton.swift
//  Agri Reach
//
//  Created by Rafiudeen on 19/05/22.
//

import UIKit

@IBDesignable class ARUIButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    var shadowLayer: CAShapeLayer!
    
    @IBInspectable var style: Int = 0 {
        didSet {
            sharedInit()
        }
    }
    
    func sharedInit() {
        
        super.layoutSubviews()
        
        switch style {
            
        case 0:
            
            if shadowLayer == nil {
                
                shadowLayer = CAShapeLayer()
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
                
                if self.backgroundColor != nil {
                    shadowLayer.fillColor = UIColor.primaryColor.cgColor
                    
                }else {
                    shadowLayer.fillColor = UIColor.white.cgColor
                }
                
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0.0, height: 4.0)
                shadowLayer.shadowOpacity = 0.5
                shadowLayer.shadowRadius = 4
                
                layer.cornerRadius = frame.height/2
                layer.insertSublayer(shadowLayer, at: 0)
            }
            
        case 1:
            
            layer.cornerRadius = 10
            backgroundColor = UIColor.red
            
            
        default: break
            
        }
    }
}
