//
//  SubcriptionPlanCell.swift
//  Agri Reach
//
//  Created by Kiran on 17/05/22.
//

import UIKit

class SubcriptionPlanCell: UICollectionViewCell {

    @IBOutlet weak var baseView2: UIView!
    @IBOutlet weak var baseView3: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.baseView2.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 20)
        self.baseView3.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20)

    }

}
