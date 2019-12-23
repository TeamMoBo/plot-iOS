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
        
        navigationSetup()
    }
    
    func navigationSetup() { //네비게이션 투명색만들기
            
<<<<<<< HEAD
        
=======
>>>>>>> master
            self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 255/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "iconsDarkBack")
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "iconsDarkBack")
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "채팅대기", style: .done, target: nil, action: nil)
            self.navigationItem.backBarButtonItem?.tintColor = .black
            //투명하게 만드는 공식처럼 기억하기
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            //네비게이션바의 백그라운드색 지정. UIImage와 동일
            self.navigationController?.navigationBar.shadowImage = UIImage()
            //shadowImage는 UIImage와 동일. 구분선 없애줌.
            self.navigationController?.navigationBar.isTranslucent = true
            //false면 반투명이다.
            self.navigationController?.view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            //뷰의 배경색 지정
    //        self.navigationController?.navigationBar.topItem?.title = "Home"
    //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 211/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)]
    //        navigationController?.navigationBar.titleTextAttributes = textAttributes
            
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
    
    
    @IBAction func FindFriendBtn(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "FriendScreen", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "FriendVC") as! FindFriendViewController
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        self.show(vc, sender: nil)
        
    }
    
    
    
}

