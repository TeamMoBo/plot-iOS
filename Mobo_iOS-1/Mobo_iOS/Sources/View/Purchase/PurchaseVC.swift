//
//  PurchaseVC.swift
//  Mobo_iOS
//
//  Created by 천유정 on 31/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class PurchaseVC: UIViewController {
    
    
    @IBOutlet weak var ticketcount: UILabel!
    @IBOutlet weak var popcorncount: UILabel!
    
    @IBOutlet weak var ticketcountselect: UILabel!
    
    @IBOutlet weak var popcorncountselect: UILabel!
    @IBOutlet weak var totalprice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        
    }
    
    func navigationSetup() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 255/255.0, green: 126/255.0, blue: 39/255.0, alpha: 1.0)]
        
        
        
        
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
     
        
        
    }
    
}

