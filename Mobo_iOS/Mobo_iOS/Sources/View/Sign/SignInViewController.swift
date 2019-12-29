//
//  SignInViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 24/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBAction func SignUpButton(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignUpScreen", bundle: nil)
               let vc = mainStoryboard.instantiateViewController(withIdentifier: "SignUpFirst") as! SignUpFirstViewController
               
        vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
        
    }
    @IBOutlet weak var Userid: UITextField!
    @IBOutlet weak var Userpwd: UITextField!
    @IBAction func SignInButton(_ sender: Any) {
        
         let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = mainStoryboard.instantiateViewController(withIdentifier: "MainHomeVC") as! MainHomeViewController
               
        vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
    }
    @IBOutlet weak var Useridview: UIView!
    @IBOutlet weak var Userpwdview: UIView!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Useridview.layer.cornerRadius = 10
        Userpwdview.layer.cornerRadius = 10
        
        Userid.delegate = self ;
        Userpwd.delegate = self ;
     //   Useridview.dropShadow(color: <#F2F2F2#>, offSet: .zero , opacity: 1, radius: 3)
     //   Useridview.dropShadow(color: <#F2F2F2#>, offSet: .zero, opacity: 1, radius: 3)
        
    }
 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        Userid.resignFirstResponder()
        Userpwd.resignFirstResponder()
        
        return true
        
    }
    
    
}
