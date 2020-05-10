//
//  Music.swift
//  iOS_ThirdWeek_Seminar_Exercise
//
//  Created by 양재욱 on 2020/05/09.
//  Copyright © 2020 양재욱. All rights reserved.
//

import Foundation
import UIKit

struct Music{
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(title: String, singer: String, coverName: String){
        self.albumImg = UIImage(named: title)
        self.musicTitle = coverName
        self.singer = singer
    }
}
