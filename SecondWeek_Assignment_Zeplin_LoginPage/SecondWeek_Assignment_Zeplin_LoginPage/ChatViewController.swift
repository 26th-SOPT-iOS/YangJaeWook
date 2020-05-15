//
//  ChatViewController.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/05/15.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    private var friendInformations: [FriendsInformation] = []

    @IBOutlet var chatTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setfriendInformations()
        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func setfriendInformations(){
        let friend1 = FriendsInformation(friendImage: .p1, name: "일준이", status: "1")
        let friend2 = FriendsInformation(friendImage: .p2, name: "이준이", status: "2")
        let friend3 = FriendsInformation(friendImage: .p3, name: "삼준이", status: "3")
        let friend4 = FriendsInformation(friendImage: .p4, name: "사준이", status: "4")
        let friend5 = FriendsInformation(friendImage: .p5, name: "오준이", status: "5")
        let friend6 = FriendsInformation(friendImage: .p6, name: "육준이", status: "6")
        let friend7 = FriendsInformation(friendImage: .p7, name: "칠준이", status: "7")
        let friend8 = FriendsInformation(friendImage: .p8, name: "팔준이", status: "8")
        
        friendInformations = [friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8]
    }

}

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendInformations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendsCell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.identifier, for: indexPath) as? FriendsCell else {return UITableViewCell()}
        
        friendsCell.setFriendInformation(friendImageName: friendInformations[indexPath.row].friendImage.getImageName(), name: friendInformations[indexPath.row].name,status: friendInformations[indexPath.row].status)
       
        
        return friendsCell
    }
}

extension ChatViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
