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
    @IBOutlet weak var name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationSetup()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func chatbtn(_ sender: Any) {
        
        
        
        
        let storyboard = UIStoryboard(name: "ChattingScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        
        //디바이스 용
        // "AmpQmmXBT1OBqF0cXl8g2VFcPNR2"
        
        
        //내 아이디 용
        vc.destinationUid = "AmpQmmXBT1OBqF0cXl8g2VFcPNR2"
        
        if vc.destinationUid == "AmpQmmXBT1OBqF0cXl8g2VFcPNR2" {
            self.name.text = "조경진"
        }
        
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
//        self.present(vc, animated: true, completion: nil)
        self.show(vc, sender: nil)
    }
    
    @IBOutlet weak var moviename: UILabel!
    
    
    func navigationSetup() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = .lightGray
        self.navigationController?.navigationBar.tintColor = .lightGray
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .done, target: nil, action: nil)
        //           self.navigationItem.backBarButtonItem?.tintColor = .white
        //투명하게 만드는 공식처럼 기억하기
   //     self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //네비게이션바의 백그라운드색 지정. UIImage와 동일
    //    self.navigationController?.navigationBar.shadowImage = UIImage()
        //shadowImage는 UIImage와 동일. 구분선 없애줌.
   //     self.navigationController?.navigationBar.isTranslucent = true
        //false면 반투명이다.
        
        //뷰의 배경색 지정
        
//                self.navigationController?.navigationBar.topItem?.title = "매칭이력"
        //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 211/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    

}
