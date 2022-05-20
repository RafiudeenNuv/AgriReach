//
//  ARUITextField.swift
//  Agri Reach
//
//  Created by Rafiudeen on 20/05/22.
//

import UIKit

@IBDesignable class ARUITextField: UITextField {
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 10
    
    @IBInspectable var style: Int = 0 {
        didSet {
            design()
        }
    }
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightViewRect: CGSize = CGSize(width: 20, height: 20) {
        didSet {
            updateView()
        }
    }
    
    private var shadowLayer: CAShapeLayer!
    private var leftImageView: UIImageView?
    private var rightImageView: UIImageView?
    private var isSecureField: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath
            shadowLayer.shadowPath = shadowLayer.path
            layer.cornerRadius = 20
            design()
            leftImageView?.tintColor = UIColor.gray
            rightImageView?.tintColor = UIColor.gray
            tintColor = UIColor.primaryColor
        }
    }
    
    @objc func showPasswordAction() {
        isSecureTextEntry = !isSecureTextEntry
        rightView?.tintColor = isSecureTextEntry ? UIColor.darkGray : UIColor.blue
    }
    
    //MARK: SetupUI
    func design() {
        
        switch style {
            
        case 0:
            
            if shadowLayer != nil {
                
                shadowLayer = CAShapeLayer()
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
                shadowLayer.fillColor = UIColor.white.cgColor
                
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0.0, height: 4.0)
                shadowLayer.shadowOpacity = 0.3
                shadowLayer.shadowRadius = 3
                
                layer.cornerRadius = frame.height/2
                layer.insertSublayer(shadowLayer, at: 0)
            }
            
        default: break
            
        }
    }
    
    @objc func textFieldDidChange(textField : UITextField) {
        
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= leftPadding
        return textRect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        textRect.size.width -= leftPadding
        return textRect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.editingRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        textRect.size.width -= leftPadding
        return textRect
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            leftImageView?.contentMode = .scaleAspectFit
            leftImageView?.image = image
            leftView = leftImageView
        }
        
        if let image = rightImage {
            
            if !isSecureField {
                rightViewMode = UITextField.ViewMode.always
                rightImageView = UIImageView(frame: CGRect(origin: .zero, size: rightViewRect))
                rightImageView?.contentMode = .scaleAspectFit
                rightImageView?.image = image
                rightView = rightImageView
            }
        }
    }
}
