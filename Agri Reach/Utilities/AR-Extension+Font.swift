//
//  AR-Extension+Font.swift
//  Agri Reach
//
//  Created by Kiran on 13/05/22.
//

import UIKit

extension UIFont {

    public enum ARfontType: String {
        case semibold = "-SemiBold"
        case regular = "-Regular"
        case light = "-Light"
        case extraBold = "-ExtraBold"
        case bold = "-Bold"
        case medium = "-Medium"
    }

    static func ARfont(_ type: ARfontType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        print(type.rawValue)
        return UIFont(name: "Poppins\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

}
