//
//  SignInViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 24/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Userid: UITextField!
    @IBOutlet weak var Userpwd: UITextField!
    @IBOutlet weak var Useridview: UIView!
    @IBOutlet weak var Userpwdview: UIView!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    let remoteconfig = RemoteConfig.remoteConfig()
    var color : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! Auth.auth().signOut()
//        let statusBar = UIView()
        
        Useridview.layer.cornerRadius = 10
        Userpwdview.layer.cornerRadius = 10
        
        Userid.delegate = self ;
        Userpwd.delegate = self ;
        loginBtn.dropShadow(color: .lightGray, offSet: CGSize(width: 0.7, height: 0.7), opacity: 0.5, radius: 5)

        
       // signUp.addTarget(self, action: #selector(presentSignup), for: .touchUpInside)
        
      //  loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if(user != nil){
                print(auth,user)
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = mainStoryboard.instantiateViewController(withIdentifier: "MainNaviVC") as! UINavigationController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
            }
        }
     
        
    }
    
    
    @objc func loginEvent(){
        
        
    }
    
    func navigationSetup() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = .mainOrange
        self.navigationController?.navigationBar.tintColor = .black
        //           self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        //           self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        
        
       // self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        //           self.navigationItem.backBarButtonItem?.tintColor = .white
        //투명하게 만드는 공식처럼 기억하기
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //네비게이션바의 백그라운드색 지정. UIImage와 동일
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //shadowImage는 UIImage와 동일. 구분선 없애줌.
        self.navigationController?.navigationBar.isTranslucent = true
        //false면 반투명이다.
        
        //뷰의 배경색 지정
        
        //        self.navigationController?.navigationBar.topItem?.title = "Home"
        //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 211/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
   
    @IBAction func SignUpButton(_ sender: Any) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignUpScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "SignUpNavi")
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        
        navigationSetup()
        
        var name = Userid.text!
        var password = Userpwd.text!
        var email = name + "@naver.com"
        
        // 사실 이거 더미라 이거 고치긴 해야됨....
        Auth.auth().signIn(withEmail: "p2@naver.com", password: "123123" ) { (user, err) in
            
            if(err != nil){
                let alret = UIAlertController(title: "로그인 실패", message: "올바르지 않은 아이디 혹은 비밀번호 입니다!", preferredStyle: UIAlertController.Style.alert)
                alret.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
                
                self.present(alret, animated: true, completion: nil)
                
            }
        }
        
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MainNaviVC") as! UINavigationController
//
//        vc.modalPresentationStyle = .fullScreen
//        self.show(vc, sender: nil)
        
       
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == Userid {
            Userid.becomeFirstResponder()
        }
        
        Userpwd.resignFirstResponder()
        return true
    }
    
    
}
