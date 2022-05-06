//
//  Tab.swift
//  Agri Reach
//
//  Created by Kiran on 28/04/22.
//

import UIKit

class Tab: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
