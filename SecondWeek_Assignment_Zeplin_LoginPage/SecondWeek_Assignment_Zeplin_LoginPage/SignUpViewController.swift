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
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        // 네비게이션 백버튼 텍스트 삭제
        navigationController?.navigationBar.backItem?.title = ""
        // 네비게이션 하단밑줄 제거
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func btnSignupAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
