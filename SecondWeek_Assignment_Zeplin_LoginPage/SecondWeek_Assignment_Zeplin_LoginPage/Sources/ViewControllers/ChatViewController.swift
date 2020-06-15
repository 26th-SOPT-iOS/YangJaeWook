//
//  ChatViewController.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/05/15.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    private var pickerController = UIImagePickerController()
    
    private var friendInformations: [FriendsInformation] = []

    @IBOutlet var chatTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setfriendInformations()
        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        pickerController.delegate = self
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
        
        friendsCell.indexPath = indexPath
        friendsCell.delegate = self
        
        friendsCell.setFriendInformation(friendImageName: friendInformations[indexPath.row].friendImage.getImageName(), name: friendInformations[indexPath.row].name,status: friendInformations[indexPath.row].status)
       
        
        return friendsCell
    }
}

extension ChatViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ChatViewController:ButtonDelegate{
    func onClickCellButton(in index: Int) {
        let alertController = UIAlertController(title: "사진 선택", message: "가져올 곳을 선택하세요", preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "사진앨범", style: .default) { action in self.openLibrary()
        }
        let photoAcgtion = UIAlertAction(title: "카메라", style: .default) { action in self.openCamera()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(galleryAction)
        alertController.addAction(photoAcgtion)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func openLibrary(){
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func openCamera(){
        pickerController.sourceType = .camera
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let url =
            info[UIImagePickerController.InfoKey.imageURL] as? URL {
            guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
            UploadService.shared.uploadImage(token, image, url.lastPathComponent) { networkResult in
                switch networkResult {
                case .success(let profileData):
                    guard let profileData = profileData as? [UserProfile] else { return }
                    print(profileData[0].profile)
                case .requestErr(let failMessage):
                    guard let message = failMessage as? String else { return }
                    print(message)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            }
            guard let friendsCell = chatTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as?
                FriendsCell else { return }
            friendsCell.btnProfile.setImage(image, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
}
