//
//  SignUpLastViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 25/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
//
class SignUpLastViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //return 버튼 누르면 키보드 내려갈수있게 설정.
    }
    
    @IBAction func nextbtn(_ sender: Any) {
        
        //        var name = id.text!
        //         var password = pwd.text!
        //        // var email = name + "@naver.com"
        //
        //         DataManager.sharedManager.setId(id: name)
        //         DataManager.sharedManager.setPwd(pwd: password)
        
        var email = DataManager.sharedManager.getId() + "@naver.com"
        var password = DataManager.sharedManager.getPwd()
        var name = DataManager.sharedManager.getName()
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, err) in
            let uid = user?.user.uid
            
            //        let image = self.selectedimg.image!.jpegData(compressionQuality: 0.1)
            
            let image = UIImage(named: "https://user-images.githubusercontent.com/46750574/71647918-4d85e980-2d40-11ea-88b7-48763303297c.png")?.jpegData(compressionQuality: 0.1)
            
            //       print(Storage.storage().reference().child("userImages").child(uid!))
            
            
            //            Storage.storage().reference().child("userImages").child(uid!).putData(image!, metadata: nil, completion: { (data, error) in
            
            
            // let imageUrl = data?.downloadURL()?.absoluteString
            let values = ["userName":name,"profileImageUrl": "https://user-images.githubusercontent.com/46750574/71647918-4d85e980-2d40-11ea-88b7-48763303297c.png", "uid":Auth.auth().currentUser?.uid]
            
            Database.database().reference().child("users").child(uid!).setValue(values, withCompletionBlock: { (err, ref) in
                
                if(err == nil){
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = mainStoryboard.instantiateViewController(withIdentifier: "MainNaviVC") as! UINavigationController
                    vc.modalPresentationStyle = .fullScreen
                    self.show(vc, sender: nil)
                }
                
                //               })
                
            })
            
            
            
        }
        
        
    }
    
 
    
}
