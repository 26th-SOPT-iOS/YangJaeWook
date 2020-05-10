//
//  ViewController.swift
//  iOS_ThirdWeek_Seminar_Exercise
//
//  Created by 양재욱 on 2020/05/09.
//  Copyright © 2020 양재욱. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    private var musicList: [Music] = []
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSinger: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setMusicList()
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    private func setMusicList() {
        let music1 = Music(title: "album_iu", singer: "아이유", coverName: "삐삐")
        let music2 = Music(title: "album_vibe", singer: "바이브", coverName: "가을타나봐")
        let music3 = Music(title: "album_yangdail", singer: "양다일", coverName: "고백")
        let music4 = Music(title: "album_im", singer: "임창정", coverName: "하루도 그대를 사랑하지 않은 적이 없었다.")
        let music5 = Music(title: "album_smtm7", singer: "루피(Loopy)", coverName: "Save (Feat. 팔토알토)")
        let music6 = Music(title: "album_ziont", singer: "자이언티", coverName: "멋지게 인사하는 법 (Feat. 슬기")
        let music7 = Music(title: "album_bts", singer: "방탄소년단", coverName: "IDOL")
        let music8 = Music(title: "album_loco", singer: "로꼬", coverName: "시간이 들겠지 (Feat. Colde)")
        let music9 = Music(title: "album_paul", singer: "폴킴", coverName: "모든 날, 모든 순간")
        let music10 = Music(title: "album_shaun", singer: "숀(SHAUN)", coverName: "Way Back Home")
        
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }
    
    
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return musicList[row].musicTitle
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = musicList[row].albumImg
        lblTitle.text = musicList[row].musicTitle
        lblSinger.text = musicList[row].singer
    }
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return musicList.count
    }
}
