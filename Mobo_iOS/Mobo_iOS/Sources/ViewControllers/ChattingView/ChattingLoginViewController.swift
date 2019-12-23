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
        let statusBar = UIView()
        self.view.addSubview(statusBar)
        statusBar.snp.makeConstraints { (m) in
            m.right.top.left.equalTo(self.view)
            m.height.equalTo(20)
        }
        
        
        color = remoteconfig["splash_background"].stringValue
        
        statusBar.backgroundColor = UIColor(hex: color)
        loginButton.backgroundColor = UIColor(hex: color)
        signUp.backgroundColor = UIColor(hex: color)
        
        
        // Do any additional setup after loading the view.
        
        signUp.addTarget(self, action: #selector(presentSignup), for: .touchUpInside)
        
        loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if(user != nil){
                let view = self.storyboard?.instantiateViewController(withIdentifier: "ChatMainViewController") as! ChattingMainViewController
                self.present(view, animated: true, completion: nil)
                
            }
        }
    }
    
    @objc func loginEvent(){
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, err) in
            
            if(err != nil){
                let alret = UIAlertController(title: "에러", message: err.debugDescription, preferredStyle: UIAlertController.Style.alert)
                alret.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
                self.present(alret, animated: true, completion: nil)
            }
        }
    }
    
    @objc func presentSignup() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatSignupVC") as! ChattingSignUpViewController
        
        self.present(vc, animated: true, completion: nil)
        
        
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

