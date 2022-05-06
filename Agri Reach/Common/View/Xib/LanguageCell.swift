//
//  LanguageCell.swift
//  Agri Reach
//
//  Created by Kiran on 04/05/22.
//

import UIKit

class LanguageCell: UITableViewCell {
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var shortLanguageTxtBaseView: UIView!
    @IBOutlet weak var shortLanguageTxt: UILabel!
    @IBOutlet weak var languageTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shortLanguageTxtBaseView.roundCornorView()
     
        
    }
    
    var language : String?{
        didSet{
            self.languageTxt.text = language
            self.shortLanguageTxt.text = language?.first?.description
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
