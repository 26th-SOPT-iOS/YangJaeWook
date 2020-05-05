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
        // Do any additional setup after loading the view.
        // 이미지뷰에 이미지 넣기
        imageView.image = UIImage(named: "soptLogo.png")
        idTextField.layer.cornerRadius = 22;
        pwTextField.layer.cornerRadius = 22;
        btnLogin.layer.cornerRadius = 24;
    }

    @IBAction func transferData(_ sender: UIButton) {
        
        // 옵셔널 바인딩 & 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
        guard let username = idTextField.text, !username.isEmpty else { return }
        guard let password = pwTextField.text, !password.isEmpty else { return }
        
        // Model이 해당 유저를 가지고 있는지 검사
        let loginSuccess: Bool = userModel.hasUser(name: username, pwd: password)
        if loginSuccess {
            let home = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController")
            self.navigationController?.pushViewController(home!, animated: true)
        }else {
                print("아이디 또는 패스워드를 확인해주세요")
            }
        
        
//        // 데이터 전달하기
//        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LogInViewController else {return}
//
//        receiveViewController.id = idTextField.text
//        receiveViewController.pw = pwTextField.text
//        // vc present
//        self.present(receiveViewController, animated: true, completion: nil)
    }
}

