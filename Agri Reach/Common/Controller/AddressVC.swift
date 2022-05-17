//
//  AddressVC.swift
//  Agri Reach
//
//  Created by Kiran on 12/05/22.
//

import UIKit

class AddressVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell("AddressListCell")
        self.tableView.separatorStyle = .none
    }
    
    
}

extension AddressVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListCell", for: indexPath) as! AddressListCell
        if indexPath.row == 0{
            cell.baseView.self.applyShadow(color: UIColor.lightGray , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius:10,borderWidth : 1 , borderColor : .lightGray,backgroundColor: .lightGrayColor)
        }
        else{
            cell.baseView.self.applyShadow(color: UIColor.lightGray , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius:10,borderWidth : 1 , borderColor : .lightGray,backgroundColor: .white)
        }
        
        return cell
    }
    
    
}



