//
//  DetailViewController.swift
//  iOS_ThirdWeek_Seminar_Exercise
//
//  Created by 양재욱 on 2020/05/09.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var imageName:String = ""
    var date:String = ""
    var subTitle:String = ""
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    private func initView(){
        weatherImageView.image = UIImage(named: imageName)
        lblDate.text = date
        lblSubTitle.text = subTitle
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
