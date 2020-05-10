//
//  MusicCell.swift
//  iOS_ThirdWeek_Seminar_Exercise
//
//  Created by 양재욱 on 2020/05/09.
//  Copyright © 2020 양재욱. All rights reserved.
//
import UIKit

class MusicCell: UICollectionViewCell {
    
    static let identifier: String = "MusicCell"

    @IBOutlet var lblSinger: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(_ musicInformation: Music){
        albumImageView.image = musicInformation.albumImg
        lblTitle.text = musicInformation.musicTitle
        lblSinger.text = musicInformation.singer
    }

}
