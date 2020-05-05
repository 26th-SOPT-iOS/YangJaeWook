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
        imgViewHome.image = UIImage(named: "oursoptBgImg")
        img1.image = UIImage(named: "9188465425230637911275922235726328076697600N")
        img2.image = UIImage(named: "9213383125230634377942948539378523368849408N")
        img3.image = UIImage(named: "9235840225230627344610312982063520952090624N")
        img4.image = UIImage(named: "9229480325230625777943802058411231781322752N")
        img5.image = UIImage(named: "9213470125230618377944548520091676373417984N")
        img6.image = UIImage(named: "9298934625230618844611168856475911587889152N")
        img7.image = UIImage(named: "9188465425230637911275922235726328076697600N")
        img8.image = UIImage(named: "9213383125230634377942948539378523368849408N")
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
