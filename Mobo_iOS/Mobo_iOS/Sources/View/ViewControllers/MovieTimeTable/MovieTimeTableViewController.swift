
//  MovieTab.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class MovieTimeTableViewController: UIViewController {

    
    @IBOutlet weak var pm12: UIButton!
    @IBOutlet weak var pm1: UIButton!
    @IBOutlet weak var pm2: UIButton!
    @IBOutlet weak var pm3: UIButton!
    @IBOutlet weak var pm4: UIButton!
    @IBOutlet weak var pm5: UIButton!
    @IBOutlet weak var pm6: UIButton!
    @IBOutlet weak var pm7: UIButton!
    @IBOutlet weak var pm8: UIButton!
    @IBOutlet weak var pm9: UIButton!
    @IBOutlet weak var pm10: UIButton!
    @IBOutlet weak var pm11: UIButton!
    @IBOutlet weak var am12: UIButton!
    @IBOutlet weak var am1: UIButton!
    @IBOutlet weak var am2: UIButton!
    
    
    @IBOutlet weak var day1: UIButton!
    @IBOutlet weak var day2: UIButton!
    @IBOutlet weak var day3: UIButton!
    @IBOutlet weak var day4: UIButton!
    @IBOutlet weak var day5: UIButton!
    @IBOutlet weak var day6: UIButton!
    @IBOutlet weak var day7: UIButton!

    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var OkBtn: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.makeRounded(cornerRadius: 20)
        OkBtn.titleEdgeInsets.bottom = 7
        
        day1.isSelected = false
        day1.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
        day2.isSelected = false
        day2.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
        day3.isSelected = false
        day3.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
        day4.isSelected = false
        day4.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
        day5.isSelected = false
        day5.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
        day6.isSelected = false
        day6.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
        day7.isSelected = false
        day7.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
        
        
        pm12.isSelected = false
        pm12.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm1.isSelected = false
        pm1.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm2.isSelected = false
        pm2.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm3.isSelected = false
        pm3.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm4.isSelected = false
        pm4.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm5.isSelected = false
        pm5.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm6.isSelected = false
        pm6.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm7.isSelected = false
        pm7.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm8.isSelected = false
        pm8.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm9.isSelected = false
        pm9.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm10.isSelected = false
        pm10.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        pm11.isSelected = false
        pm11.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        am12.isSelected = false
        am12.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        am1.isSelected = false
        am1.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        am2.isSelected = false
        am2.addTarget(self, action: #selector(ClockClick), for: .touchUpInside)
        

        
//        let navigationHeight = UIApplication.shared.statusBarFrame.height
//            + self.navigationController!.navigationBar.frame.height



        //navigationSetup()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        pm12.makeRounded(cornerRadius: 5)
        pm12.setBorder(borderColor: .borderGray, borderWidth: 1)
        pm12.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        
        pm1.makeRounded(cornerRadius: 5)
        pm1.setBorder(borderColor: .borderGray, borderWidth: 1)
        pm1.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm2.makeRounded(cornerRadius: 5)
        pm2.setBorder(borderColor: .borderGray, borderWidth: 1)
        pm2.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        
        pm3.makeRounded(cornerRadius: 5)
               pm3.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm3.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm4.makeRounded(cornerRadius: 5)
               pm4.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm4.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm5.makeRounded(cornerRadius: 5)
               pm5.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm5.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm6.makeRounded(cornerRadius: 5)
               pm6.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm6.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm7.makeRounded(cornerRadius: 5)
               pm7.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm7.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm8.makeRounded(cornerRadius: 5)
               pm8.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm8.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm9.makeRounded(cornerRadius: 5)
               pm9.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm9.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm10.makeRounded(cornerRadius: 5)
               pm10.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm10.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        pm11.makeRounded(cornerRadius: 5)
               pm11.setBorder(borderColor: .borderGray, borderWidth: 1)
               pm11.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        am12.makeRounded(cornerRadius: 5)
                      am12.setBorder(borderColor: .borderGray, borderWidth: 1)
                      am12.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        
        am1.makeRounded(cornerRadius: 5)
               am1.setBorder(borderColor: .borderGray, borderWidth: 1)
               am1.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        am2.makeRounded(cornerRadius: 5)
               am2.setBorder(borderColor: .borderGray, borderWidth: 1)
               am2.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        
    }

    func navigationSetup() { //네비게이션 투명색만들기

//        rgb 255 126 39
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 255/255.0, green: 126.0/255.0, blue: 39.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "iconsDarkBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "iconsDarkBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
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

    
    @objc func dayClick(sender: UIButton) {
        
        
        if day1.isTouchInside {
        
           if (day1.isSelected) == false {
         
            day1.isSelected = true
            day1.setTitleColor(.mainOrange, for: .normal)
            day1.setBackgroundColor(.white, for: .normal)
            
            day1.makeRounded(cornerRadius: 10)
            day1.clipsToBounds = true
            //day1.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if day1.isSelected
           {
            day1.isSelected = false
            day1.setTitleColor(.white, for: .normal)
            day1.setBackgroundColor(.clear, for: .normal)
            day1.makeRounded(cornerRadius: 10)
            day1.clipsToBounds = true

        
           }
        }
        
        if day2.isTouchInside {
        
           if (day2.isSelected) == false {
         
            day2.isSelected = true
            day2.setTitleColor(.white, for: .normal)
            day2.setBackgroundColor(.white, for: .normal)
            day2.setBorder(borderColor: .clear, borderWidth: 1)
            day2.makeRounded(cornerRadius: 10)
            day2.clipsToBounds = true
        
           }
               
           else if day2.isSelected
           {
            day2.isSelected = false
            day2.setTitleColor(.white, for: .normal)
            day2.setBackgroundColor(.clear, for: .normal)
            day2.makeRounded(cornerRadius: 10)
            day2.clipsToBounds = true

        
           }
        }

        if day3.isTouchInside {
        
           if (day3.isSelected) == false {
         
            day3.isSelected = true
            day3.setTitleColor(.white, for: .normal)
            day3.setBackgroundColor(.white, for: .normal)
            day3.setBorder(borderColor: .clear, borderWidth: 1)
            day3.makeRounded(cornerRadius: 10)
            day3.clipsToBounds = true
        
           }
               
           else if day3.isSelected
           {
            day3.isSelected = false
            day3.setTitleColor(.white, for: .normal)
            day3.setBackgroundColor(.clear, for: .normal)
            day3.makeRounded(cornerRadius: 10)
            day3.clipsToBounds = true

        
           }
        }
        if day4.isTouchInside {
        
           if (day4.isSelected) == false {
         
            day4.isSelected = true
            day4.setTitleColor(.white, for: .normal)
            day4.setBackgroundColor(.white, for: .normal)
            day4.setBorder(borderColor: .clear, borderWidth: 1)
            day4.makeRounded(cornerRadius: 10)
            day4.clipsToBounds = true
        
           }
               
           else if day4.isSelected
           {
            day4.isSelected = false
            day4.setTitleColor(.white, for: .normal)
            day4.setBackgroundColor(.clear, for: .normal)
            day4.makeRounded(cornerRadius: 10)
            day4.clipsToBounds = true

        
           }
        }
        if day5.isTouchInside {
        
           if (day5.isSelected) == false {
         
            day5.isSelected = true
            day5.setTitleColor(.white, for: .normal)
            day5.setBackgroundColor(.white, for: .normal)
            day5.setBorder(borderColor: .clear, borderWidth: 1)
            day5.makeRounded(cornerRadius: 10)
            day5.clipsToBounds = true
        
           }
               
           else if day5.isSelected
           {
            day5.isSelected = false
            day5.setTitleColor(.white, for: .normal)
            day5.setBackgroundColor(.clear, for: .normal)
            day5.makeRounded(cornerRadius: 10)
            day5.clipsToBounds = true

        
           }
        }
        if day6.isTouchInside {
        
           if (day6.isSelected) == false {
         
            day6.isSelected = true
            day6.setTitleColor(.white, for: .normal)
            day6.setBackgroundColor(.white, for: .normal)
            day6.setBorder(borderColor: .clear, borderWidth: 1)
            day6.makeRounded(cornerRadius: 10)
            day6.clipsToBounds = true
        
           }
               
           else if day6.isSelected
           {
            day6.isSelected = false
            day6.setTitleColor(.white, for: .normal)
            day6.setBackgroundColor(.clear, for: .normal)
            day6.makeRounded(cornerRadius: 10)
            day6.clipsToBounds = true

        
           }
        }
        if day7.isTouchInside {
        
           if (day7.isSelected) == false {
         
            day7.isSelected = true
            day7.setTitleColor(.white, for: .normal)
            day7.setBackgroundColor(.white, for: .normal)
            day7.setBorder(borderColor: .clear, borderWidth: 1)
            day7.makeRounded(cornerRadius: 10)
            day7.clipsToBounds = true
        
           }
               
           else if day7.isSelected
           {
            day7.isSelected = false
            day7.setTitleColor(.white, for: .normal)
            day7.setBackgroundColor(.clear, for: .normal)
            day7.makeRounded(cornerRadius: 10)
            day7.clipsToBounds = true

        
           }
        }
        
        
    }
    
    @objc func ClockClick(sender: UIButton) {
              
           //print(pm12.isSelected)
           
        if pm12.isTouchInside {
        
           if (pm12.isSelected) == false {
         
            pm12.isSelected = true
            pm12.setTitleColor(.white, for: .normal)
            pm12.backgroundColor = .mainOrange
            pm12.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm12.isSelected
           {
            pm12.isSelected = false
            pm12.setTitleColor(.black, for: .normal)
            pm12.backgroundColor = .white
            pm12.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        
        if pm1.isTouchInside {
        
           if (pm1.isSelected) == false {
         
            pm1.isSelected = true
            pm1.setTitleColor(.white, for: .normal)
            pm1.backgroundColor = .mainOrange
            pm1.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm1.isSelected
           {
            pm1.isSelected = false
            pm1.setTitleColor(.black, for: .normal)
            pm1.backgroundColor = .white
            pm1.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        
        if pm2.isTouchInside {
        
           if (pm2.isSelected) == false {
         
            pm2.isSelected = true
            pm2.setTitleColor(.white, for: .normal)
            pm2.backgroundColor = .mainOrange
            pm2.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm2.isSelected
           {
            pm2.isSelected = false
            pm2.setTitleColor(.black, for: .normal)
            pm2.backgroundColor = .white
            pm2.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm3.isTouchInside {
        
           if (pm3.isSelected) == false {
         
            pm3.isSelected = true
            pm3.setTitleColor(.white, for: .normal)
            pm3.backgroundColor = .mainOrange
            pm3.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm3.isSelected
           {
            pm3.isSelected = false
            pm3.setTitleColor(.black, for: .normal)
            pm3.backgroundColor = .white
            pm3.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm4.isTouchInside {
        
           if (pm4.isSelected) == false {
         
            pm4.isSelected = true
            pm4.setTitleColor(.white, for: .normal)
            pm4.backgroundColor = .mainOrange
            pm4.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm4.isSelected
           {
            pm4.isSelected = false
            pm4.setTitleColor(.black, for: .normal)
            pm4.backgroundColor = .white
            pm4.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm5.isTouchInside {
        
           if (pm5.isSelected) == false {
         
            pm5.isSelected = true
            pm5.setTitleColor(.white, for: .normal)
            pm5.backgroundColor = .mainOrange
            pm5.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm5.isSelected
           {
            pm5.isSelected = false
            pm5.setTitleColor(.black, for: .normal)
            pm5.backgroundColor = .white
            pm5.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm6.isTouchInside {
        
           if (pm6.isSelected) == false {
         
            pm6.isSelected = true
            pm6.setTitleColor(.white, for: .normal)
            pm6.backgroundColor = .mainOrange
            pm6.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm6.isSelected
           {
            pm6.isSelected = false
            pm6.setTitleColor(.black, for: .normal)
            pm6.backgroundColor = .white
            pm6.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm7.isTouchInside {
        
           if (pm7.isSelected) == false {
         
            pm7.isSelected = true
            pm7.setTitleColor(.white, for: .normal)
            pm7.backgroundColor = .mainOrange
            pm7.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm7.isSelected
           {
            pm7.isSelected = false
            pm7.setTitleColor(.black, for: .normal)
            pm7.backgroundColor = .white
            pm7.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm8.isTouchInside {
        
           if (pm8.isSelected) == false {
         
            pm8.isSelected = true
            pm8.setTitleColor(.white, for: .normal)
            pm8.backgroundColor = .mainOrange
            pm8.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm8.isSelected
           {
            pm8.isSelected = false
            pm8.setTitleColor(.black, for: .normal)
            pm8.backgroundColor = .white
            pm8.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm9.isTouchInside {
        
           if (pm9.isSelected) == false {
         
            pm9.isSelected = true
            pm9.setTitleColor(.white, for: .normal)
            pm9.backgroundColor = .mainOrange
            pm9.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm9.isSelected
           {
            pm9.isSelected = false
            pm9.setTitleColor(.black, for: .normal)
            pm9.backgroundColor = .white
            pm9.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm10.isTouchInside {
        
           if (pm10.isSelected) == false {
         
            pm10.isSelected = true
            pm10.setTitleColor(.white, for: .normal)
            pm10.backgroundColor = .mainOrange
            pm10.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm10.isSelected
           {
            pm10.isSelected = false
            pm10.setTitleColor(.black, for: .normal)
            pm10.backgroundColor = .white
            pm10.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if pm11.isTouchInside {
        
           if (pm11.isSelected) == false {
         
            pm11.isSelected = true
            pm11.setTitleColor(.white, for: .normal)
            pm11.backgroundColor = .mainOrange
            pm11.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if pm11.isSelected
           {
            pm11.isSelected = false
            pm11.setTitleColor(.black, for: .normal)
            pm11.backgroundColor = .white
            pm11.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if am12.isTouchInside {
        
           if (am12.isSelected) == false {
         
            am12.isSelected = true
            am12.setTitleColor(.white, for: .normal)
            am12.backgroundColor = .mainOrange
            am12.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if am12.isSelected
           {
            am12.isSelected = false
            am12.setTitleColor(.black, for: .normal)
            am12.backgroundColor = .white
            am12.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if am1.isTouchInside {
        
           if (am1.isSelected) == false {
         
            am1.isSelected = true
            am1.setTitleColor(.white, for: .normal)
            am1.backgroundColor = .mainOrange
            am1.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if am12.isSelected
           {
            am1.isSelected = false
            am1.setTitleColor(.black, for: .normal)
            am1.backgroundColor = .white
            am1.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
        if am2.isTouchInside {
        
           if (am2.isSelected) == false {
         
            am2.isSelected = true
            am2.setTitleColor(.white, for: .normal)
            am2.backgroundColor = .mainOrange
            am2.setBorder(borderColor: .clear, borderWidth: 1)
            
        
           }
               
           else if am2.isSelected
           {
            am2.isSelected = false
            am2.setTitleColor(.black, for: .normal)
            am2.backgroundColor = .white
            am2.setBorder(borderColor: .borderGray, borderWidth: 1)

        
           }
        }
    }
   
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
