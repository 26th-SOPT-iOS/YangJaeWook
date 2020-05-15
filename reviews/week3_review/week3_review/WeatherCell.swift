//
//  WeatherCellTableViewCell.swift
//  week3_review
//
//  Created by 양재욱 on 2020/05/12.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    static let identifier: String = "WeatherCell"
    
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDateInformation(weatherImageName: String, date:String, subTitle: String){
        weatherImageView.image = UIImage(named: weatherImageName)
        lblDate.text = date
        lblSubTitle.text = subTitle
    }

}
