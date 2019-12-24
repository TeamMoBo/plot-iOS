//
//  SignUpService.swift
//  Mobo_iOS
//
//  Created by 천유정 on 24/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import Foundation
import Alamofire

class SignupService {
    /* 회원가입 메소드 */
    
    //Sigleton pattern
    // 생애 주기에서 딱 한 번 객체가 생성되고 전역으로 접근이 가능
    static let shared = SignupService()
    
    func signup(_ id: String, _ pwd: String,
                _ name : String, _ phone : String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "id": id,
            "pwd": pwd,
            "name": name,
            "phone": phone
        ]
        
        Alamofire.request(APIConstants.SignupURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
            
               //             print("request", response.request)
                 //          print("response", response.response)
                   //         print("data", response.data)
                     //       print("result", response.result)
            
            // parameter 위치
            switch response.result {
                
            // 통신 성공 - 네트워크 연결
            case .success:
                
                //value는 byte로 되어있음 print(value)
                if let value = response.result.value {
                    
                    //response의 response 안에 있는 statusCode를 추출
                    if let status = response.response?.statusCode {
                        
                        // Http Status Code 상태 코드에 따라 분기 처리
                        //200 성공, 300 리다이랙션, 400 클라오류, 500 서버오류
                        switch status {
                        case 200:
                            
                            //decording 시작
                            //선언했던 decodable protocol 사용
                            do {
                                let decoder = JSONDecoder()
                                print("value", value)
                                let result = try decoder.decode(ResponseString.self, from: value)
                                
                                // ResponseString에 있는 success로 분기 처리
                                // decording 성공했는지 확인
                                switch result.success {
                                    
                                case true:
                                    print("success")
                                    completion(.success(result.data))
                                case false:
                                    completion(.requestErr(result.message))
                                }
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                                print(APIConstants.LoginURL)
                            }
                        case 400:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }// switch
                    }// iflet
                }
                break
          // 통신 실패 - 네트워크 연결
                          case .failure(let err):
                              print(err.localizedDescription)
                              completion(.networkFail)
                              // .networkFail이라는 반환 값이 넘어감
                              break
                          } // response.result switch
                  } // alamofire.request
              } // func login
          } // struct
