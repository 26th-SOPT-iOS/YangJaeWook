//
//  ViewController.swift
//  FirstWeek_Homework_02
//
//  Created by 양재욱 on 2020/04/18.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //var userModel = UserModel()
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
        
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
                
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr") case .networkFail: print("networkFail") }
        }
    }
    
    @IBAction func btnSignup(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "signupviewcontroller") as? SignUpViewController else { return }
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}


