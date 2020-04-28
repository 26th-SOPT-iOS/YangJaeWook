//
//  LogInViewController.swift
//  FirstWeek_Homework_02
//
//  Created by 양재욱 on 2020/04/18.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    var id: String?
    var pw: String?
    
    @IBOutlet weak var showIdTextField: UITextField!
    @IBOutlet weak var showPwTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setTextFields()
    }
    
    private func setTextFields() {
        //Optional Binding
        guard let id = self.id else {return}
        guard let pw = self.pw else {return}
        
        // Label 값 대입
        showIdTextField.text = id
        showPwTextField.text = pw
    }

    
    @IBAction func btnLogOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
