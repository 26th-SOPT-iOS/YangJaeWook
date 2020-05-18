//
//  SignUpViewController.swift
//  FirstWeek_Homework_02
//
//  Created by 양재욱 on 2020/04/18.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //var userModel = UserModel()
    @IBOutlet var signupImageView: UIImageView!
    @IBOutlet var signupName: UITextField!
    @IBOutlet var signupEmail: UITextField!
    @IBOutlet var signupPw: UITextField!
    @IBOutlet var btnSignup: UIButton!
    @IBOutlet var signupPhone: UITextField!
    @IBOutlet var signupId: UITextField!
    @IBOutlet var textFields: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signupName.layer.cornerRadius = 22
        signupEmail.layer.cornerRadius = 22
        signupPw.layer.cornerRadius = 22
        signupId.layer.cornerRadius = 22
        signupPhone.layer.cornerRadius = 22
        btnSignup.layer.cornerRadius = 22
    }
    
    @IBAction func btnSignupAction(_ sender: Any) {
        
        guard let inputID = signupId.text else { return }
        guard let inputPWD = signupPw.text else { return }
        guard let inputNAME = signupName.text else { return }
        guard let inputEMAIL = signupEmail.text else { return }
        guard let inputPHONE = signupPhone.text else { return }
        
        
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
            switch networkResult {
                
            case .success(let data):
                guard let data = data as? String else { return }
                UserDefaults.standard.set(data, forKey: "data")
//                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as? UITabBarController else { return }
//                tabbarController.modalPresentationStyle = .fullScreen
//                self.present(tabbarController, animated: true, completion: nil)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail") }
        }
        
    }
    
}
