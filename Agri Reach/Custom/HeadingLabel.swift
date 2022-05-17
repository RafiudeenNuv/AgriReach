//
//  HeadingLabel.swift
//  Agri Reach
//
//  Created by Kiran on 13/05/22.
//

import UIKit
import Localize_Swift

class HeadingLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.DefaultTextColor
        self.font = UIFont.ARfont(.semibold, size: 17)
        let lbl = self.text ?? ""
        self.text = lbl.localized()

        
    }
}


class RegularHeadingLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.DefaultTextColor
        self.font = UIFont.ARfont(.regular, size: 16)
        let lbl = self.text ?? ""
        self.text = lbl.localized()

        
    }
}

class MediumHeadingLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.DefaultTextColor
        self.font = UIFont.ARfont(.regular, size: 14)
        let lbl = self.text ?? ""
        self.text = lbl.localized()

        
    }
}

class SemiBoldHeadingLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.DefaultTextColor
        self.font = UIFont.ARfont(.regular, size: 16)
        let lbl = self.text ?? ""
        self.text = lbl.localized()

        
    }
}

class GrayColoredSmallLbl: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.lightGray
        self.font = UIFont.ARfont(.regular, size: 14)
        let lbl = self.text ?? ""
        self.text = lbl.localized()

        
    }
}


class GrayColoredRegularLbl: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.lightGray
        self.font = UIFont.ARfont(.regular, size: 16)
        let lbl = self.text ?? ""
        self.text = lbl.localized()

        
    }
}
