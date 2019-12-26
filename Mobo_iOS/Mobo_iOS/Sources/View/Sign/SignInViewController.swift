//
//  SignInViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 24/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var LoginImage: UIImageView!
    
    @IBOutlet weak var SignUpButton: UIButton!
    @IBAction func SignUpButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUp") as! SignUpFirstViewController
        
        self.present(nextVC, animated: true)
        
    }
    @IBOutlet weak var Userid: UITextField!
    @IBOutlet weak var Userpwd: UITextField!
    @IBAction func SignInButton(_ sender: Any) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginImage.layer.cornerRadius = 10
        LoginImage.layer.masksToBounds = true
        
    }
    
    
    
    
    
}
