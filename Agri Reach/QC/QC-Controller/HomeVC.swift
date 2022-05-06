//
//  HomeVC.swift
//  Agri Reach
//
//  Created by Kiran on 18/04/22.
//

import UIKit
import Localize_Swift

var ontime = -1
class HomeVC: BaseVC {

    @IBOutlet weak var menuTab: UITableView!
    @IBOutlet weak var menuLeadingConstant: NSLayoutConstraint!
    var menuArr = ["Home".localized(),"Reports".localized(),"Subscriptions".localized(),"Transactions".localized(),"Mandi Prices".localized(),"My Profile".localized(),"Settings".localized(),"Logout".localized()]
    override func viewDidLoad() {
        super.viewDidLoad()
        

        menuLeadingConstant.constant = -500
        self.menuTab.delegate = self
        self.menuTab.dataSource = self
        self.menuTab.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }
  
    override func changeLayout() {
        super.changeLayout()
        menuArr = ["Home".localized(),"Reports".localized(),"Subscriptions".localized(),"Transactions".localized(),"Mandi Prices".localized(),"My Profile".localized(),"Settings".localized(),"Logout".localized()]
        self.menuTab.reloadData()
        
    }
    
    
    
    @IBAction func menuBtn(_ sender: Any) {
        if menuLeadingConstant.constant == -500{
            UIView.animate(withDuration: 0.5,
                           delay: 0.3,
                           options: [],
                           animations: { [weak self] in
                            self?.menuLeadingConstant.constant = 0

//                            self?.view.layoutIfNeeded()
              }, completion: nil)
        }
        else{
            menuLeadingConstant.constant = -500
        }
    }
    
    
    

}

extension HomeVC : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.menuTxt.text = self.menuArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuCell
        self.menuBtn(self)

        if indexPath.row == 6{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let home = storyBoard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
            home.modalPresentationStyle = .formSheet
            navigationController?.pushViewController(home, animated: true);
        }
    }

}
