//
//  ChattingViewController.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/24.
//  Copyright © 2019 조경진. All rights reserved.
//


import UIKit
import SnapKit
import Firebase


class ChattingLoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    let remoteconfig = RemoteConfig.remoteConfig()
    var color : String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        try! Auth.auth().signOut()
        
        
        //statusBar.backgroundColor = .mainOrange
        loginButton.backgroundColor = .mainOrange
        signUp.backgroundColor = .mainOrange
        
        
        // Do any additional setup after loading the view.
        
        signUp.addTarget(self, action: #selector(presentSignup), for: .touchUpInside)
        
        loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if(user != nil){
                let view = self.storyboard?.instantiateViewController(withIdentifier: "ChatMainViewTabbarController") as! UITabBarController
                
                view.modalPresentationStyle = .fullScreen
                self.present(view, animated: true, completion: nil)
                
            }
        }
    }
    
    @objc func loginEvent(){
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, err) in
            
            if(err != nil){
                let alret = UIAlertController(title: "에러", message: err.debugDescription, preferredStyle: UIAlertController.Style.alert)
                alret.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
                
               // self.present(alret, animated: true, completion: nil)
                
            }
        }
    }
    
    @objc func presentSignup() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatSignupVC") as! ChattingSignUpViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
           //return 버튼 누르면 키보드 내려갈수있게 설정.
       }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    
    
}

