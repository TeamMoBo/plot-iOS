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
    
    @IBOutlet weak var AnimationView: UIView!
    @IBOutlet weak var PopupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        // Do any additional setup after loading the view.
        
    }
    
    func startAnimation() {
        let animationView = Lottie.AnimationView(name:"loader")
        
        animationView.frame = CGRect(x:0, y:0, width:400, height:400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        AnimationView.addSubview(animationView)
        animationView.play()
    }
    
    @IBAction func PopUpAct(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "PopUpScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopupVC") as! PopupInventoryViewController
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
}

