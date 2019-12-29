//
//  SignUpSecondVC.swift
//  Mobo_iOS
//
//  Created by 천유정 on 29/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Hashtags



class SignUpSecondVC: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var womanimg: UIImageView!
    @IBOutlet weak var manimg: UIImageView!
    @IBOutlet weak var nomatterimg: UIImageView!
    
    @IBOutlet weak var womanbtn: UIButton!
    @IBOutlet weak var manbtn: UIButton!
    @IBOutlet weak var nomatterbtn: UIButton!
    
    @IBOutlet weak var letter: UITextField!
    
    @IBOutlet weak var shortletter: UITextField!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shortletter.delegate = self as? UITextFieldDelegate;
        
        womanbtn.addTarget(self, action: #selector( getter: womanSelected ), for: .touchUpInside)
        
        manbtn.addTarget(self, action: #selector( getter: manSelected ), for: .touchUpInside)
        
        nomatterbtn.addTarget(self, action: #selector( getter: nomatterSelected ), for: .touchUpInside)
        
    }
    
    @IBAction func nextbtn(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignUpScreen", bundle: nil)
               let vc = mainStoryboard.instantiateViewController(withIdentifier: "SignUpLastViewController") as! SignUpLastViewController
                             
               vc.modalPresentationStyle = .fullScreen
               self.show(vc, sender: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        shortletter.resignFirstResponder()
        
        return true
        
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
