//
//  SignUpViewController.swift
//  FirstWeek_Homework_02
//
//  Created by 양재욱 on 2020/04/18.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var signupId: UITextField!
    @IBOutlet var signupPw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func transferData(_ sender: Any) {
        
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LogInViewController else {return}
        
        receiveViewController.id = signupId.text
        receiveViewController.pw = signupPw.text
        
        self.present(receiveViewController, animated: true) {
            self.navigationController?.popViewController(animated: false)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
