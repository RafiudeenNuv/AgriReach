//
//  Color+Extension.swift
//  travelVlo
//
//  Created by KG Sajith on 09/01/20.
//  Copyright © 2020 KG Sajith. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {

class func colorWithHexString (_ hex: String) -> UIColor {
    var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
    /**      var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercased() */
    if cString.hasPrefix("#") {
        cString = (cString as NSString).substring(from: 1)
    }
    if cString.count != 6 {
        return UIColor.gray
    }
    let rString = (cString as NSString).substring(to: 2)
    let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
    let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
    var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    return UIColor(red: CGFloat(r) / 255.0,
                   green: CGFloat(g) / 255.0,
                   blue: CGFloat(b) / 255.0,
                   alpha: CGFloat(1))
}
    
    
}
