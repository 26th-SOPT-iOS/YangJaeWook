//
//  Music.swift
//  week3_review
//
//  Created by 양재욱 on 2020/05/10.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

struct Music{
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(coverName:String, singer:String, title: String){
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
}

