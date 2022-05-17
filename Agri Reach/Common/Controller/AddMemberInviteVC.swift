//
//  AddMemberInviteVC.swift
//  Agri Reach
//
//  Created by Kiran on 17/05/22.
//

import UIKit

class AddMemberInviteVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerCell("DropDownCell")
        self.tableView.separatorStyle = .none
    }

}

extension AddMemberInviteVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownCell", for: indexPath) as! DropDownCell
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}
