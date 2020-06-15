//
//  UIImageView+Extensions.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/06/13.
//  Copyright © 2020 양재욱. All rights reserved.
//

import Kingfisher

extension UIImageView{

    func setImage(from url: String) {
        self.kf.indicatorType = .activity
        let cache = ImageCache.default
        
        cache.retrieveImage(forKey: url) { result in
            switch result {
            case .success(let value):
                if value.image != nil { self.image = value.image }
                else { self.kf.setImage(with: URL(string: url)) }
            case .failure(let err):
                print(err.errorCode)
            }
        }
    }

}

