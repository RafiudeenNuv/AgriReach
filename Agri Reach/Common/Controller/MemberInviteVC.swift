//
//  MemberInviteVC.swift
//  Agri Reach
//
//  Created by Kiran on 16/05/22.
//

import UIKit

class MemberInviteVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addANewTeamMemberLbl: HeadingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerCell("MemberInviteCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
}

extension MemberInviteVC  : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberInviteCell", for: indexPath) as! MemberInviteCell
        return cell
    }
    
    
    
}
