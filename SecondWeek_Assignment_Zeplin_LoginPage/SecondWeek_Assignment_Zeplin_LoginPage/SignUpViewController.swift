//
//  SignUpViewController.swift
//  FirstWeek_Homework_02
//
//  Created by 양재욱 on 2020/04/18.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var userModel = UserModel()
    @IBOutlet var signupImageView: UIImageView!
    @IBOutlet var signupName: UITextField!
    @IBOutlet var signupEmail: UITextField!
    @IBOutlet var signupPw: UITextField!
    @IBOutlet var btnSignup: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signupName.layer.cornerRadius = 22
        signupEmail.layer.cornerRadius = 22
        signupPw.layer.cornerRadius = 22
        btnSignup.layer.cornerRadius = 22
    }
    
    @IBAction func btnSignupAction(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }

}
