//
//  WeatherCell.swift
//  iOS_ThirdWeek_Seminar_Exercise
//
//  Created by 양재욱 on 2020/05/09.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    static let identifier: String = "WeatherCell"

    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    @IBOutlet var weatherImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDateInformation(weatherImageName:String, date:String, subTitle:String){
        weatherImgView.image = UIImage(named: weatherImageName)
        lblDate.text = date
        lblSubTitle.text = subTitle
    }

}
