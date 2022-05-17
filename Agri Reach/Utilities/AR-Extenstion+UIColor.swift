//
//  AR-Extenstion+UIColor.swift
//  Agri Reach
//
//  Created by Kiran on 26/04/22.
//

import Foundation
import UIKit

extension UIColor {
    class func colorFromHex(hex: Int) -> UIColor { return UIColor(red: (CGFloat((hex & 0xFF0000) >> 16)) / 255.0, green: (CGFloat((hex & 0xFF00) >> 8)) / 255.0, blue: (CGFloat(hex & 0xFF)) / 255.0, alpha: 1.0)
    }
    static var primaryColor  : UIColor { return UIColor.colorWithHexString("#2B2F5C")}
    
    static var lightGrayColor  : UIColor { return UIColor.colorWithHexString("#F4F4F4")}
    
    static var DefaultTextColor : UIColor {UIColor.init(named: "DefaultTextColor") ?? UIColor.red }
    
    static var GrayColor : UIColor {UIColor.init(named: "GrayColor") ?? UIColor.red }
    

    
    static var ColorWhite                               : UIColor { return  UIColor.colorFromHex(hex: 0xffffff) }
    static var ColorThemeOrange                         : UIColor { return  UIColor.colorFromHex(hex: 0xff7936) }
    static var ColorThemeBlue                           : UIColor { return  UIColor.colorFromHex(hex: 0x36bcff) }
    static var ColorLightGrey                           : UIColor { return  UIColor.colorFromHex(hex: 0x818181) }
    static var ColorBlack                               : UIColor { return  UIColor.colorFromHex(hex: 0x000000) }
    static var ColorLine                                : UIColor { return  UIColor.colorFromHex(hex: 0xEAEAEA) }
    static var ColorGrey                                : UIColor { return  UIColor.colorFromHex(hex: 0x919191) }
    static var ColorFbBlue                              : UIColor { return  UIColor.colorFromHex(hex: 0x3D4774) }
    static var ColorGoogleRed                           : UIColor { return  UIColor.colorFromHex(hex: 0xC3242A) }
    static var ColorGreen                               : UIColor { return  UIColor.colorFromHex(hex: 0x137114) }
    static var ColorRed                                 : UIColor { return  UIColor.colorFromHex(hex: 0xf80001) }
    static var ColorBabyBlue                                 : UIColor { return  UIColor.colorFromHex(hex: 0x89CFF0) }
    
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.ColorBlack
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
