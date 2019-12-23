//
//  MoviewTabOne.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class MovieTimeTableViewController: UIViewController {
    
    
    //IBOutlets..
    @IBOutlet weak var FindBtn: UIButton!
    @IBOutlet weak var lastweekBtn: UIButton!
    @IBOutlet weak var nextweekBtn: UIButton!
    
    @IBOutlet weak var lastView: UIView!
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var TableView: UIView!
    
    
    
    //Inits..
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationSetup()
        
        FindBtn.backgroundColor = .mainOragne
        view.backgroundColor = UIColor.init(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
       
//        nextView.backgroundColor = UIColor.init(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
//        lastView.backgroundColor = UIColor.init(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
//        TableView.backgroundColor = UIColor.init(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        
    }
    
    
    
    
    @IBAction func lastBtnClick(_ sender: Any) {
        
        nextView.layer.shadowOpacity = 0.0
        
        lastView.layer.shadowColor = UIColor.black.cgColor
        TableView.layer.shadowColor = UIColor.black.cgColor
        
        lastView.layer.shadowOpacity = 0.5
        TableView.layer.shadowOpacity = 0.5
        
        nextView.backgroundColor = UIColor.init(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        lastView.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        
    }
    
    @IBAction func nextBtnClick(_ sender: Any) {
        
        
        lastView.layer.shadowOpacity = 0.0
        
        nextView.layer.shadowColor = UIColor.black.cgColor
        TableView.layer.shadowColor = UIColor.black.cgColor
        
        nextView.layer.shadowOpacity = 0.5
        TableView.layer.shadowOpacity = 0.5
        
        lastView.backgroundColor = UIColor.init(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        nextView.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        
    }
    
    
}

