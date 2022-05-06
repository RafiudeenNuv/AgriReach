//
//  LocationEnableVC.swift
//  Agri Reach
//
//  Created by Kiran on 05/05/22.
//

import UIKit

class LocationEnableVC: UIViewController {

    @IBOutlet weak var turnOnBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.turnOnBtn.applyButtonShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: self.turnOnBtn.frame.height / 2)


    }

}
