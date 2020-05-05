//
//  UserModel.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/05/05.
//  Copyright © 2020 양재욱. All rights reserved.
//

import Foundation

final class UserModel {
    
    struct User {
        var username: String
        var password: String
    }
    
    var model: [User] = [
       User(username: "zico", password: "1234"),
       User(username: "dean", password: "5678"),
       User(username: "penomeco", password: "0101")
    ]
    
    // hasUser 검사 method
    func hasUser(name: String, pwd: String) -> Bool {
        var result = false
        for user in model {
            if user.username == name && user.password == pwd {
                result = true
            }
        }
        return result
    }
        
    // newUser 추가 method
    func addUser(name: String, pwd: String) {
        let newUser = User(username: name, password: pwd)
        model.append(newUser)
    }

}
