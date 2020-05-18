//
//  HomeViewController.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/05/05.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var imgViewHome: UIImageView!
    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    @IBOutlet var img3: UIImageView!
    @IBOutlet var img4: UIImageView!
    @IBOutlet var img5: UIImageView!
    @IBOutlet var img6: UIImageView!
    @IBOutlet var img7: UIImageView!
    @IBOutlet var img8: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)

        img1.image = UIImage(named: "p1")
        img2.image = UIImage(named: "p2")
        img3.image = UIImage(named: "p3")
        img4.image = UIImage(named: "p4")
        img5.image = UIImage(named: "p5")
        img6.image = UIImage(named: "p6")
        img7.image = UIImage(named: "p7")
        img8.image = UIImage(named: "p8")
        // Do any additional setup after loading the view.
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
