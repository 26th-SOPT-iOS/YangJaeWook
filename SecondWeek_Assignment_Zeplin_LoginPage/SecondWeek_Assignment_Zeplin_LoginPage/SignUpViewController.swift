//
//  SignUpViewController.swift
//  FirstWeek_Homework_02
//
//  Created by 양재욱 on 2020/04/18.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var signupImageView: UIImageView!
    @IBOutlet var signupName: UITextField!
    @IBOutlet var signupEmail: UITextField!
    @IBOutlet var signupPw: UITextField!
    @IBOutlet var btnSignup: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupImageView.image = UIImage(named: "soptJoinLogo.png")
        // Do any additional setup after loading the view.
        signupName.layer.cornerRadius = 22
        signupEmail.layer.cornerRadius = 22
        signupPw.layer.cornerRadius = 22
        btnSignup.layer.cornerRadius = 22
    }
    
//    @IBAction func transferData(_ sender: Any) {
//
//        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LogInViewController else {return}
//
//
//        self.present(receiveViewController, animated: true) {
//            self.navigationController?.popViewController(animated: false)
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
