//
//  ARUIButton.swift
//  Agri Reach
//
//  Created by Rafiudeen on 19/05/22.
//

import UIKit

@IBDesignable class ARUIButton: UIButton {
    
    @IBInspectable var style: Int = 0 {
        didSet {
            updateView()
        }
    }
    
    var shadowLayer: CAShapeLayer!
    
    override func awakeFromNib() {
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch style {
            
        case 0:
            if shadowLayer == nil {
                
                shadowLayer = CAShapeLayer()
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
                shadowLayer.fillColor = UIColor.primaryColor.cgColor
                
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0.0, height: 4.0)
                shadowLayer.shadowOpacity = 0.5
                shadowLayer.shadowRadius = 4
                
                layer.cornerRadius = frame.height/2
                layer.insertSublayer(shadowLayer, at: 0)
                self.setTitleColor(UIColor.white, for: .normal)
            }
            
        case 1:
            
            if shadowLayer == nil {
                
                shadowLayer = CAShapeLayer()
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
                shadowLayer.fillColor = UIColor.red.cgColor
                
                shadowLayer.shadowColor = UIColor.darkGray.cgColor
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0, height: 8.0)
                shadowLayer.shadowOpacity = 0.2
                shadowLayer.shadowRadius = 2
                
                layer.cornerRadius = frame.height/2
                layer.insertSublayer(shadowLayer, at: 0)
                self.setTitleColor(UIColor.white, for: .normal)
            }
            
        case 2:
            
            if shadowLayer == nil {
                
                shadowLayer = CAShapeLayer()
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
                shadowLayer.fillColor = UIColor.white.cgColor
                
                shadowLayer.shadowColor = UIColor.darkGray.cgColor
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0, height: 8.0)
                shadowLayer.shadowOpacity = 0.2
                shadowLayer.shadowRadius = 2
                
                layer.borderColor = UIColor.primaryColor.cgColor
                layer.borderWidth = 1
                layer.cornerRadius = frame.height/2
                layer.insertSublayer(shadowLayer, at: 0)
                self.setTitleColor(UIColor.primaryColor, for: .normal)
            }
            
        default: break
            
        }
    }
    
    func updateView() {
        
        switch style {
            
        case 0:
            
            if shadowLayer != nil {
                
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
                shadowLayer.fillColor = UIColor.primaryColor.cgColor
                
                shadowLayer.shadowColor = UIColor.darkGray.cgColor
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0, height: 8.0)
                shadowLayer.shadowOpacity = 0.2
                shadowLayer.shadowRadius = 2
                
                layer.cornerRadius = frame.height/2
                self.setTitleColor(UIColor.white, for: .normal)
            }
            
        case 1:
            if shadowLayer != nil {
                
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
                shadowLayer.fillColor = UIColor.red.cgColor
                
                shadowLayer.shadowColor = UIColor.darkGray.cgColor
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0, height: 8.0)
                shadowLayer.shadowOpacity = 0.2
                shadowLayer.shadowRadius = 2
                
                self.setTitleColor(UIColor.white, for: .normal)
            }
            
        case 2:
            
            if shadowLayer != nil {
                
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
                shadowLayer.fillColor = UIColor.white.cgColor
                
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                shadowLayer.shadowOpacity = 0.1
                shadowLayer.shadowRadius = 0.5
                
                layer.borderColor = UIColor.primaryColor.cgColor
                layer.borderWidth = 1
                layer.cornerRadius = frame.height/2
                self.setTitleColor(UIColor.primaryColor, for: .normal)
            }
            
        default: break
            
        }
    }
}
