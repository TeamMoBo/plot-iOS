//
//  SignInViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 24/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var SignInUserId: UITextField!
    @IBOutlet weak var SignInUserPwd: UITextField!
    
    @IBAction func SignUpButton(_ sender: Any) {
        guard let main = self.storyboard?.instantiateViewController(withIdentifier: "StartHome") else {return}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        guard let userid = SignInUserId.text else {return}
        guard let userpwd = SignInUserPwd.text else {return}
        
        SignInService.shared.login(userid, userpwd) {
                  data in
                  
                  switch data {
                      
                  case .success(let data):
                      
                      // DataClass 에서 받은 유저 정보 반환
                      let user_data = data as! DataClass
                      
                      // 사용자의 토큰, 이름, 이메일, 전화번호 받아오기
                      // 비밀번호는 안 받아와도 됨
                      UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                      UserDefaults.standard.set(user_data.name, forKey: "name")
                    
                      
                      guard let main = self.storyboard?.instantiateViewController(withIdentifier: "StartHome") else {return}
                      
                      self.present(main, animated: true)
                      
                  case .requestErr(let message):
                      self.simpleAlert(title: "로그인 실패", message: "\(message)", type: 0)
                      
                  case .pathErr:
                      print(".pathErr")
                      
                  case .serverErr:
                      print(".serverErr")
                      
                  case .networkFail:
                      self.simpleAlert(title: "로그인 실패", message: "네트워크 상태를 확인해주세요.", type: 0)
                  }
                  
              }
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
