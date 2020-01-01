//
//  ChatWaitingViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 30/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class ChatWaitingViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var uni: UITextField!
    @IBOutlet weak var major: UITextField!
    @IBOutlet weak var place: UITextField!
    
    @IBOutlet weak var movieinfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        age.delegate = self
         uni.delegate = self
         major.delegate = self
         place.delegate = self
        
    }
    
    @IBAction func chatbtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ChattingScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatLoginVC") as! ChattingLoginViewController
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        self.show(vc, sender: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        age.resignFirstResponder()
        uni.resignFirstResponder()
        major.resignFirstResponder()
        place.resignFirstResponder()
        
        return true
        
    }

   

}
