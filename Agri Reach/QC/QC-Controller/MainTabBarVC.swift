//
//  MainTabBarVC.swift
//  Agri Reach
//
//  Created by Kiran on 19/04/22.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector: #selector(yourfunction(notfication:)), name: .postNotifi, object: nil)

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if tabBar.selectedItem?.title == "Back"{
            let storyboard = Tab.instantiate(fromAppStoryboard: .Home)
            
            navigationController?.pushViewController(storyboard, animated: true)
        }
        
    }
    
    @objc func yourfunction(notfication: NSNotification) {
        guard let items = tabBar.items else { return }

        items[0].title = "Home".localized()
        items[1].title = "Reports".localized()
        items[2].title = "Upload".localized()
        items[3].title = "Orders".localized()
        items[4].title = "Profile".localized()
    }
    

}
