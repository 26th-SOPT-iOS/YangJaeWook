//
//  FriendsCell.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/05/15.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

protocol ButtonDelegate {
    func onClickCellButton(in index: Int)
}

class FriendsCell: UITableViewCell {

    static let identifier:String = "FriendsCell"
    
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblStatus: UILabel!
   
    var delegate: ButtonDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func setProfile(_ sender: Any) {
        delegate?.onClickCellButton(in: indexPath!.row)
    }
    
    func setFriendInformation(friendImageName: String, name:String, status:String){
        btnProfile.setImage(UIImage(named: friendImageName), for: .normal)
        lblName.text = name
        lblStatus.text = status
    }
}



