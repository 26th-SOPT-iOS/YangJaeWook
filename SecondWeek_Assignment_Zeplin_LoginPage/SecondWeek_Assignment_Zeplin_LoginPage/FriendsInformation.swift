//
//  FriendsInformation.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/05/15.
//  Copyright © 2020 양재욱. All rights reserved.
//

import Foundation

struct FriendsInformation{
    var friendImage: Friend
    var name : String
    var status: String
    
    init(friendImage: Friend, name:String, status:String){
        self.friendImage = friendImage
        self.name = name
        self.status = status
    }
}

enum Friend{
    case p1
    case p2
    case p3
    case p4
    case p5
    case p6
    case p7
    case p8
    
    func getImageName()->String{
        switch self{
        case .p1: return "p1"
        case .p2: return "p2"
        case .p3: return "p3"
        case .p4: return "p4"
        case .p5: return "p5"
        case .p6: return "p6"
        case .p7: return "p7"
        case .p8: return "p8"
        }
    }
    
}
