//
//  SettingVC.swift
//  Agri Reach
//
//  Created by Kiran on 19/04/22.
//

import UIKit
import Localize_Swift
class SettingVC: BaseVC {

    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var settingLbl: UILabel!
    @IBOutlet weak var selectedLanguage: R_UIButton!
    var selectLan = "English"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLaguage()

    }
    func changeLaguage(){
        self.languageLbl.text = "Language".localized()
        self.settingLbl.text = "Settings".localized()
        self.selectedLanguage.setTitle(selectLan, for: .normal)
    }
    
    override func changeLayout() {
        super.changeLayout()
        changeLaguage()

    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func changeLanuage(_ sender: Any) {
        let alert = UIAlertController(title: "Select a language".localized(), message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "English", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                    Localize.setCurrentLanguage("en")
                    
                    self.selectLan = "Engish"
                    NotificationCenter.default.post(name: .postNotifi, object: nil)

            case .cancel:
            print("cancel")
            
            case .destructive:
            print("destructive")

            }
        }))
        alert.addAction(UIAlertAction(title: "हिन्दी", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                    Localize.setCurrentLanguage("hi")
                    self.selectLan = "हिन्दी"

                    NotificationCenter.default.post(name: .postNotifi, object: nil)


            case .cancel:
            print("cancel")
            
            case .destructive:
            print("destructive")

            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: { action in
            switch action.style{
                case .default:
                    print("default")

            case .cancel:
            print("cancel")
            
            case .destructive:
            print("destructive")

            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

}
