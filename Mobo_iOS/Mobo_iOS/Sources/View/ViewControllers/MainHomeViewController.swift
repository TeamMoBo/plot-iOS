//
//  MovieTab.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class MainHomeViewController: UIViewController {
    
    
    @IBOutlet weak var iCarouselView: iCarousel!
    
    var imgArr = [  UIImage(named:"Alexandra Daddario"),
                       UIImage(named:"Angelina Jolie") ,
                       UIImage(named:"Anne Hathaway") ,
                       UIImage(named:"Dakota Johnson") ,
                       UIImage(named:"Emma Stone") ,
                       UIImage(named:"Emma Watson") ,
                       UIImage(named:"Halle Berry") ,
                       UIImage(named:"Jennifer Lawrence") ,
                       UIImage(named:"Jessica Alba") ,
                       UIImage(named:"Scarlett Johansson") ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iCarouselView.type = .rotary
               iCarouselView.contentMode = .scaleAspectFill
               iCarouselView.isPagingEnabled = true
        
        
        navigationSetup()
        
        
    }
    
    func navigationSetup() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 255/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "iconsDarkBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "iconsDarkBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "시간선택", style: .done, target: nil, action: nil)
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

extension MainHomeViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imageView: UIImageView!
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 300))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as? UIImageView
        }
        
        imageView.image = imgArr[index]
        return imageView
    }
    
    
}
