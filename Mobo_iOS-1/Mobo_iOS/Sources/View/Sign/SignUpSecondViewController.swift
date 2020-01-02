//
//  SignUpSecondViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 25/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class SignUpSecondViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var womanimg: UIImageView!
    @IBOutlet weak var manimg: UIImageView!
    @IBOutlet weak var nomatterimg: UIImageView!
    
    @IBOutlet weak var womanbtn: UIButton!
    @IBOutlet weak var manbtn: UIButton!
    @IBOutlet weak var nomatterbtn: UIButton!
    
    @IBOutlet weak var agemin: UITextField!
    @IBOutlet weak var agemax: UITextField!
    
    @IBOutlet weak var nextbtn: UIImageView!
    
    
    
    @objc var womanSelected: Bool = false {
             didSet {
                 let image = womanSelected ? UIImage(imageLiteralResourceName: "icSelected") : UIImage(imageLiteralResourceName: "icUnselected")
                 womanimg.image = image
             }
         }
         
    @objc var manSelected: Bool = false {
             didSet {
                 let image = manSelected ? UIImage(imageLiteralResourceName: "icSelected") : UIImage(imageLiteralResourceName: "icUnselected")
                 manimg.image = image
             }
         }
    @objc var nomatterSelected: Bool = false {
             didSet {
                 let image = nomatterSelected ? UIImage(imageLiteralResourceName: "icSelected") : UIImage(imageLiteralResourceName: "icUnselected")
                 nomatterimg.image = image
             }
         }

    @IBAction func next(_ sender: Any) {
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        womanbtn.addTarget(self, action: #selector(getter: womanSelected), for: .touchUpInside)
              
        manbtn.addTarget(self, action: #selector(getter: manSelected), for: .touchUpInside)
              
        nomatterbtn.addTarget(self, action: #selector(getter: nomatterSelected), for: .touchUpInside)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //return 버튼 누르면 키보드 내려갈수있게 설정.
    }
    
  
    @objc func womanSelect() {
           womanSelected = true
           manSelected = false
           nomatterSelected = false
       }
       
       @objc func manSelect() {
           womanSelected = false
           manSelected = true
           nomatterSelected = false
       }
       
       @objc func nomatterSelect() {
           womanSelected = false
           manSelected = false
           nomatterSelected = true
       }
    
}
