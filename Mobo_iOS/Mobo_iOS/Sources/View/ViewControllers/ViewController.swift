//
//  ViewController.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var AnimationView: LottieView!
    
    var mTimer:  Timer? = nil
    var number: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        // Do any additional setup after loading the view.
        ticktok()
        
        
    }
    
    func startAnimation() {
        let animationView = Lottie.AnimationView(name:"splah_io_change")
        
        animationView.frame = CGRect(x:0, y:0, width:375, height:812)
        animationView.center = self.view.center
        animationView.contentMode = .scaleToFill
        
        AnimationView.addSubview(animationView)
        animationView.play()
    }
    
    func ticktok(){
        
        print(11111)
        if let timer = mTimer {
            //timer 객체가 nil 이 아닌경우에는 invalid 상태에만 시작한다
            if !timer.isValid {
                /** 1초마다 timerCallback함수를 호출하는 타이머 */
                mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            }
        }else{
            //timer 객체가 nil 인 경우에 객체를 생성하고 타이머를 시작한다
            /** 1초마다 timerCallback함수를 호출하는 타이머 */
            mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCallback(){
        number += 1
        if number == 3 {
            //Thread.sleep(forTimeInterval: 1) //1초만 재우기
            
            let storyboard = UIStoryboard(name: "SignInScreen", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
    
    
}

