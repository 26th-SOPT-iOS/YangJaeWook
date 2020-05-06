//
//  ViewController.swift
//  FirstWeek_Homework_02
//
//  Created by 양재욱 on 2020/04/18.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userModel = UserModel()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationColor()
        navigationController?.setNavigationBarHidden(false, animated: false)
        // 네비게이션 하단밑줄 제거
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        // 이미지뷰에 이미지 넣기
        idTextField.layer.cornerRadius = 22;
        pwTextField.layer.cornerRadius = 22;
        btnLogin.layer.cornerRadius = 24;
    }

    func setNavigationColor() {
        // 네비게이션 영역 그라데이션색
        navigationController?.navigationBar.tintColor = .blue
        // 네비게이션 영역색
        navigationController?.navigationBar.barTintColor = .white
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let alert = UIAlertController(title: "오류", message: "이메일 또는 비밀번호를 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : nil)

        // 옵셔널 바인딩 & 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
        guard let username = idTextField.text, !username.isEmpty else { return }
        guard let password = pwTextField.text, !password.isEmpty else { return }
        
        // Model이 해당 유저를 가지고 있는지 검사
        let loginSuccess: Bool = userModel.hasUser(name: username, pwd: password)
        if loginSuccess {
            let home = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController")
            self.navigationController?.pushViewController(home!, animated: true)
        }else {
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            }
        
    }
    
    @IBAction func btnSignup(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "signupviewcontroller") as? SignUpViewController else { return }
        
        navigationController?.pushViewController(nextVC, animated: true)
    }

}


