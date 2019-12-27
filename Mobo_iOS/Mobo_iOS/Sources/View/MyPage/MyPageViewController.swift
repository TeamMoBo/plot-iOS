//
//  MyPageViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 27/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        
    }

    func navigationSetup() { //네비게이션 투명색만들기
               
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
   
}



