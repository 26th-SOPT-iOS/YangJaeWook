//
//  UploadService.swift
//  SecondWeek_Assignment_Zeplin_LoginPage
//
//  Created by 양재욱 on 2020/06/13.
//  Copyright © 2020 양재욱. All rights reserved.
//

import Foundation
import Alamofire

struct UploadService {
    static let shared = UploadService()
    func uploadImage(_ token: String, _ image: UIImage, _ imageName: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "jwt" : token
        ]
        Alamofire.upload(multipartFormData: { multipartFormData in
            // 압축을 하겠다
            let imageData = image.jpegData(compressionQuality: 1.0)!
            // Multipart form-data 는 여러 파일을 붙여서 보낼 수 있다.
            multipartFormData.append(imageData, withName: "profile", fileName: imageName, mimeType: "image/jpeg") //여기까지가 인코딩 하는 부분
        }, usingThreshold: UInt64.init(), to: APIConstants.profileURL, method: .post, headers: headers, encodingCompletion: { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (progress) in
                    print(progress.fractionCompleted) // 업로드의 진행률을 로그로 확인할 수 있다.
                })
                upload.responseData { response in
                    guard let statusCode = response.response?.statusCode, let data = response.result.value else { return }
                    let networkResult = self.judge(statusCode, data)
                    completion(networkResult) //  업로드 통신을 직접적으로 시작하는 코드이다.
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.networkFail)
            }
        })
    }
    private func judge(_ statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUpdating(data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func isUpdating(_ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(ProfileData.self, from: data) else { return .pathErr }
        if decodeData.status == 200 {
            guard let profileData = decodeData.data else { return .requestErr(decodeData.message) }
            return .success(profileData)
        } else {
            return .requestErr(decodeData.message)
        }
    }
}
