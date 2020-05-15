//
//  FriendsCell.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/05/15.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {

    static let identifier:String = "FriendsCell"
    
    @IBOutlet var friendsImageView: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblStatus: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setFriendInformation(friendImageName: String, name:String, status:String){
        friendsImageView.image = UIImage(named: friendImageName)
        lblName.text = name
        lblStatus.text = status
    }
}
