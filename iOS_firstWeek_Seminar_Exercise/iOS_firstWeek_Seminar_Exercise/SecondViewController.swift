//
//  SecondViewController.swift
//  iOS_firstWeek_Seminar_Exercise
//
//  Created by 양재욱 on 2020/04/18.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblSwitchOnOff: UILabel!
    @IBOutlet weak var lblFrequency: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setLabels()
    }
    
    private func setLabels() {
        //Optional Binding
        guard let name = self.name else {return}
        guard let email = self.email else {return}
        guard let isOnOff = self.isOnOff else {return}
        guard let frequency = self.frequency else {return}
        
        // Label 값 대입
        lblName.text = name
        lblEmail.text = email
        lblSwitchOnOff.text = isOnOff ? "On" : "Off"
        lblFrequency.text = "\(frequency)"
    }
    
    @IBAction func backScreen(_ sender: Any) {
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
