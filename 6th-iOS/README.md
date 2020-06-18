# Week 6 (5/23)



### 세미나 : Server x Client 합동 세미나

<div>
	<img width="300" height="500" alt="스크린샷 2020-06-18 오후 5 36 38" src="https://user-images.githubusercontent.com/56633607/84998078-5487a380-b18a-11ea-87eb-abd0f69d48a5.png">
  <img width="373" height="700" alt="스크린샷 2020-06-18 오후 5 52 45" src="https://user-images.githubusercontent.com/56633607/84999748-8ac62280-b18c-11ea-9442-559ebe434a60.png"></div>
<div>
  <img width="983" alt="스크린샷 2020-06-18 오후 5 39 56" src="https://user-images.githubusercontent.com/56633607/84998396-bba55800-b18a-11ea-9173-50de09138ac2.png">
<img width="983" alt="스크린샷 2020-06-18 오후 5 43 14" src="https://user-images.githubusercontent.com/56633607/84998755-353d4600-b18b-11ea-88b1-b6cbe61f2f74.png">
  <img width="779" alt="스크린샷 2020-06-18 오후 5 45 15" src="https://user-images.githubusercontent.com/56633607/84998957-7a617800-b18b-11ea-94e6-95b291de529f.png">
  <img width="779" alt="스크린샷 2020-06-18 오후 5 51 40" src="https://user-images.githubusercontent.com/56633607/84999623-5eaaa180-b18c-11ea-9a8e-eef751b92fb8.png">
</div>

> 먼저 서버파트원들과 어떤 부분에서 request를 보내고 response json을 받을 지에 대해 상의했다.



아직 수준 높은 통신 구현은 어려워서 Detail view의 이미지와 텍스트를 받는 작업을 했다.

<hr/>

### ***서버에서 텍스트를 받아오는 방법***

1. json을 받아서 디코딩할 구조체 생성
2. @@@Service 구조체를 만들어서 통신 설정을 해준다
3. singleton 객체를 사용해서 통신한다

> initial setting
>
> > APIConstants
> >
> > ```swift
> > //
> > //  APIConstants.swift
> > //  5th_Seminar(todayhouse)
> > //
> > //  Created by hjyoo on 2020/05/30.
> > //  Copyright © 2020 hjyoo. All rights reserved.
> > //
> > 
> > import Foundation
> > 
> > struct APIConstants {
> >     static let baseURL = "http://52.78.27.117:3001"
> >     static let bannerURL = APIConstants.baseURL + "/banner"
> >     static let postURL = APIConstants.baseURL + "/post/3"
> >     static let poststoryURL = APIConstants.baseURL + "/post/story"
> >     static let postpopularURL = APIConstants.baseURL + "/post/popular"
> >     static let sellURL = APIConstants.baseURL + "/sell"
> >     static let sellidURL = APIConstants.baseURL + "/sell/:id"
> >     static let sellmainURL = APIConstants.baseURL + "/sell/main"
> > }
> > ```
> >
> > NetworkResult
> >
> > ```swift
> > //
> > //  NetworkResult.swift
> > //  5th_Seminar(todayhouse)
> > //
> > //  Created by hjyoo on 2020/05/30.
> > //  Copyright © 2020 hjyoo. All rights reserved.
> > //
> > 
> > import Foundation
> > 
> > // 서버 통신 결과 ==> 성공, 요청에러, 경로에러, 서버내부에러, 네트워크연결실패
> > enum NetworkResult<T> {
> >     case success(T)
> >     case requestErr(T)
> >     case pathErr
> >     case serverErr
> >     case networkFail
> > }
> > ```



> **json을 디코딩해서 저장할 구조체가 필요하다**

Example)

<img width="839" alt="스크린샷 2020-06-18 오후 5 59 35" src="https://user-images.githubusercontent.com/56633607/85000520-7c2c3b00-b18d-11ea-951a-9621180b3c08.png">

```swift
//
//  PicviewData.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/06/09.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation

struct PicviewData: Codable{
    var status: Int
    var success: Bool
    var message: String
    var data: [DetailData]?
    
    enum CodingKeys: String, CodingKey{
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([DetailData].self, forKey: .data)) ?? nil
    }
}

struct DetailData: Codable{
    var imgUrl: String
    var company: String
    var price: Int
    var content: String
}

```

### **반드시 json 형태와 같은 형태의 구조체를 설계해야한다!!**

> **@@@Service 구조체 생성**

Example)

```swift
//
//  PicviewService.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/06/09.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation
import Alamofire

struct PicviewService {
    //private init(){}
    static let shared = PicviewService()
    
    let header: HTTPHeaders = ["Content-Type": "application/json"]
    var toggle = false
    
    func getData(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let dataRequest = Alamofire.request(APIConstants.postURL)

        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode,value)
                completion(networkResult)
            case .failure : completion(.networkFail)
            }
        }
    }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isProduct(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isProduct(by data:Data) ->NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(PicviewData.self, from: data) else { return .pathErr }
        
        print("====================Roomdata====================")
        print(decodedData)
        guard let roomData = decodedData.data else { return .requestErr(decodedData.message) }

        return .success(roomData)
    }
}
```



> **singleton 객체 사용하여 통신**

```swift
func setRoomDetails(){
        
        PicviewService.shared.getData(){ NetworkResult in
            switch NetworkResult {
            case .success(let data):
                guard let data = data as? [DetailData] else {return}
                print("@@@@@@data@@@@@@")
                print(data)
                for data in data{
                    self.roomDetailList.append(RoomDetail(imageUrl: data.imgUrl, factoryName: data.company, description: data.content, price: data.price))
                }
                self.roomDetailCollectionView.reloadData() 

            case .requestErr(_):
                print("Request error@@")
            case .pathErr:
                print("path error")
            case .serverErr:
                print("server error")
            case .networkFail:
                print("network error")
            }
        }
}
```



> imageUrl을 받아와서 UIImage 적용시키기

```swift
//
//  RoomDetailCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/06/09.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class RoomDetailCell: UICollectionViewCell {
    static let identifier:String = "RoomDetailCell"
    
    @IBOutlet weak var roomDetailImage: UIImageView!
    @IBOutlet weak var roomDetailFName: UILabel!
    @IBOutlet weak var roomDetailDesc: UILabel!
    @IBOutlet weak var roomDetailPrice: UILabel!
    
    func set(roomDetail: RoomDetail){
        let url = URL(string: roomDetail.imageUrl)
        let data = try? Data(contentsOf: url!)
        
        roomDetailImage.image = UIImage(data: data!)
        roomDetailFName.text = roomDetail.factoryName
        roomDetailDesc.text = roomDetail.description
        roomDetailPrice.text = String(roomDetail.price)+" 원"
    }
}
```



### ***Tableview, CollectionView에서 데이터가 안넘어올때?***

<img width="952" alt="스크린샷 2020-06-18 오후 6 20 20" src="https://user-images.githubusercontent.com/56633607/85002840-60766400-b190-11ea-828a-87f2b1d0a527.png">

#### **데이터를 받아오는 Thread가 다르기 때문에 데이터를 UIView에 넣어줄 때 **

#### **reload()를 호출해야 한다.**

ex) self.roomDetailCollectionView.reloadData()



