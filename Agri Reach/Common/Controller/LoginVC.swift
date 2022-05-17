//
//  LoginVC.swift
//  Agri Reach
//
//  Created by Kiran on 26/04/22.
//

import UIKit
import SKCountryPicker

class LoginVC: UIViewController {

    @IBOutlet weak var welcomeImageView : UIView!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var flagImg: UIImageView!
    @IBOutlet weak var countycodeTxt: UITextField!
    @IBOutlet weak var signinBtn: R_UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let storyboard = WalkThroughVC.instantiate(fromAppStoryboard: .Home)
            storyboard.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(storyboard, animated: true)
        }
    }
    func setupUI(){
        let country = CountryManager.shared.currentCountry
        self.flagImg.image =  country?.flag
        self.countycodeTxt.text = country?.dialingCode
        self.welcomeImageView.applyCornerRadius(cornerRadius: welcomeImageView.frame.height / 2 , borderColor: .white, borderWidth: 0)
        self.mobileView.applyShadow(color: UIColor.colorWithHexString("#2B2F5C") , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: 10)
        self.signinBtn.applyButtonShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: self.signinBtn.frame.height / 2)

    }
    

    @IBAction func countryPickerBtn(_ sender : Any){
        var countryController = CountryPickerWithSectionViewController.presentController(on: self) { (country: Country) in
            self.flagImg.image = country.flag
            self.countycodeTxt.text = country.dialingCode
            
        }
        
        // can customize the countryPicker here e.g font and color
    }
    
    @IBAction func loginBtn(_ sender: Any) {

        
        
        let storyboard = VerificationVC.instantiate(fromAppStoryboard: .Authentication)
        navigationController?.pushViewController(storyboard, animated: true)
        
    }
    
    
    
   
}
