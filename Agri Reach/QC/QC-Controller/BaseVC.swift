//
//  BaseVC.swift
//  Agri Reach
//
//  Created by Kiran on 19/04/22.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(yourfunction(notfication:)), name: .postNotifi, object: nil)


    }
    
    @objc func yourfunction(notfication: NSNotification) {
        changeLayout()
        
    }
    
    func changeLayout(){
        
    }
    
    



}
extension Notification.Name {
      static let postNotifi = Notification.Name("changeLan")
}
