//
//  SignInViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 24/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Userid: UITextField!
    @IBOutlet weak var Userpwd: UITextField!
    @IBOutlet weak var Useridview: UIView!
    @IBOutlet weak var Userpwdview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Useridview.layer.cornerRadius = 10
        Userpwdview.layer.cornerRadius = 10
        
        Userid.delegate = self ;
        Userpwd.delegate = self ;
        
        
        
    }
    
    func navigationSetup() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = .mainOrange
        self.navigationController?.navigationBar.tintColor = .black
        //           self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        //           self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        
        
      //  let barButton = UIBarButtonItem()
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btnMypage-1"), style: UIBarButtonItem.Style.plain, target: self, action: "myPageBtn")
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icChatingpage-1"), style: UIBarButtonItem.Style.plain, target: self, action: "chatBtn")

        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
    
        
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
    
    @objc func chatBtn(_ sender: Any) {
        

        self.navigationController?.navigationBar.barTintColor = .mainOrange
              self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
              self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
              self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .mainOrange
              //투명하게 만드는 공식처럼 기억하기
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
              //네비게이션바의 백그라운드색 지정. UIImage와 동일
            self.navigationController?.navigationBar.shadowImage = UIImage()
              //shadowImage는 UIImage와 동일. 구분선 없애줌.
            self.navigationController?.navigationBar.isTranslucent = true
        
          self.navigationController?.navigationBar.topItem?.title = "매칭 이력"
       let storyboard = UIStoryboard(name: "ChattingScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatLoginVC") as! ChattingLoginViewController
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        self.show(vc, sender: nil)
        
    }
    
    @objc func myPageBtn(_ sender: Any) {
            
    //        navigationSetup0()

            let mainStoryboard: UIStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "MyPageVC") as! MyPageViewController
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)

            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    
    @IBAction func SignUpButton(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignUpScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "SignUpFirst") as! SignUpFirstViewController
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        
        navigationSetup()
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MainNaviVC") as! UINavigationController
        
        vc.modalPresentationStyle = .fullScreen
        self.show(vc, sender: nil)
        
       
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
