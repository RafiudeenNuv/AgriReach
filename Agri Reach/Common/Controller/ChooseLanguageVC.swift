//
//  ChooseLanguageVC.swift
//  Agri Reach
//
//  Created by Kiran on 04/05/22.
//

import UIKit

class ChooseLanguageVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoView: UIView!
    var languageArr = ["English","Hindi","Malayalam","Others"]
    var selectedIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoView.roundCornorView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell("LanguageCell")
        self.tableView.separatorStyle = .none

    }
}

extension ChooseLanguageVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath) as! LanguageCell
        cell.language = self.languageArr[indexPath.row]
        if selectedIndex == indexPath.row{
            cell.baseView.selectLanguageView(languageTxt: cell.languageTxt)
        }
        else{
            cell.baseView.unSelectLanguageView(languageTxt: cell.languageTxt)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let storyboard = LoginVC.instantiate(fromAppStoryboard: .Authentication)
            self.navigationController?.pushViewController(storyboard, animated: true)
        }
        
    }
    
    
}
