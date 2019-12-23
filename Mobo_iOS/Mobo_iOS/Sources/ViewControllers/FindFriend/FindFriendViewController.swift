//
//  FindFriendViewController.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class FindFriendViewController: UIViewController {
    
    
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var ticketView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.accountImageView.layer.cornerRadius = (self.accountImageView.frame.width / 2)
        self.accountImageView.layer.borderWidth = 0
        self.accountImageView.layer.masksToBounds = true
        self.accountImageView.contentMode = .scaleAspectFit
        
        
        profileView.layer.shadowOpacity = 0.5
        profileView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        ticketView.layer.cornerRadius = 10
        ticketView.backgroundColor = .mainOragne
        
    }
        
    
    @IBAction func goChatBeforeBtn(_ sender: Any) {
        
        
    }
    
}
