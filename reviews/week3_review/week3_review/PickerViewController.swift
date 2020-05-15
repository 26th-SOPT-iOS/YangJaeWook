//
//  ViewController.swift
//  week3_review
//
//  Created by 양재욱 on 2020/05/10.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {

    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSinger: UILabel!
    @IBOutlet var albumImageView: UIImageView!
    
    private var musicList: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setMusicList()
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    private func setMusicList() {
        
        // 구조체를 이용한 상수 선언
        let music1 = Music(coverName: "album_iu", singer: "아이유", title: "삐삐")
        let music2 = Music(coverName: "album_vibe", singer: "바이브", title: "가을타나봐")
        let music3 = Music(coverName: "album_yangdail", singer: "양다일", title: "고백")
        let music4 = Music(coverName: "album_im", singer: "임창정", title: "하루도 그대를 사랑하지 않은 적이 없었다.")
        let music5 = Music(coverName: "album_smtm7", singer: "루피(Loopy)", title: "Save (Feat. 팔토알토)")
        let music6 = Music(coverName: "album_ziont", singer: "자이언티", title: "멋지게 인사하는 법 (Feat. 슬기")
        let music7 = Music(coverName: "album_bts", singer: "방탄소년단", title: "IDOL")
        let music8 = Music(coverName: "album_loco", singer: "로꼬", title: "시간이 들겠지 (Feat. Colde)")
        let music9 = Music(coverName: "album_paul", singer: "폴킴", title: "모든 날, 모든 순간")
        let music10 = Music(coverName: "album_shaun", singer: "숀(SHAUN)", title: "Way Back Home")
        
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
        
    }

}

// UIPickerViewDataSource, Delegate = Protocol
extension PickerViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return musicList.count
    }
    
}

extension PickerViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return musicList[row].musicTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        albumImageView.image = musicList[row].albumImg
        lblTitle.text = musicList[row].musicTitle
        lblSinger.text = musicList[row].singer
    }
    
}
