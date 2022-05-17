//
//  SubtitleLightLabel.swift
//  Agri Reach
//
//  Created by Kiran on 13/05/22.
//

import UIKit

class SubtitleLightLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.GrayColor
        self.font = UIFont.ARfont(.light, size: 12)
    }
}

