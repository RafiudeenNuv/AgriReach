//
//  UserNameLabel.swift
//  Agri Reach
//
//  Created by Kiran on 13/05/22.
//

import UIKit

class UserNameLabel: UILabel {

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
        self.text = "Charlotte"
        self.textColor = .primaryColor
        self.font = UIFont.ARfont(.bold, size: 17)
    }
}
