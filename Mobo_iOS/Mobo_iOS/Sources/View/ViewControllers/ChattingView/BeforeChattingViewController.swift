//
//  BeforeChattingViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 02/01/2020.
//  Copyright © 2020 조경진. All rights reserved.
//

import UIKit

class BeforeChattingViewController: UIViewController {

    
    public var destinationUid :String? // 나중에 내가 채팅할 대상의 uid

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func chatbtn(_ sender: Any) {
        
        
        
        
        let storyboard = UIStoryboard(name: "ChattingScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        
        vc.destinationUid = "chokj"
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        self.present(vc, animated: true, completion: nil)
//        self.show(vc, sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
