//
//  SignUpFirstViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 25/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class SignUpFirstViewController: UIViewController ,UITextFieldDelegate {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var selectedimg: UIImageView!
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var uni: UITextField!
    @IBOutlet weak var major: UITextField!
    @IBOutlet weak var kakao: UITextField!
    
    @IBOutlet weak var womanimg: UIImageView!
    @IBOutlet weak var manimg: UIImageView!
    
    @IBOutlet weak var womanbtn: UIButton!
    @IBOutlet weak var manbtn: UIButton!
    
    var womanSelected: Bool = false {
        didSet {
            let image = womanSelected ? UIImage(imageLiteralResourceName: "icSelected") : UIImage(imageLiteralResourceName: "icUnselected")
            womanimg.image = image
        }
    }
    
    var manSelected: Bool = false {
        didSet {
            let image = manSelected ? UIImage(imageLiteralResourceName: "icSelected") : UIImage(imageLiteralResourceName: "icUnselected")
            manimg.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        selectedimg.layer.cornerRadius = selectedimg.frame.height / 2
        picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        nickname.delegate = self;
        name.delegate = self;
        age.delegate = self;
        id.delegate = self;
        pwd.delegate = self;
        uni.delegate = self;
        major.delegate = self;
        kakao.delegate = self;
        
        womanbtn.addTarget(self, action: #selector(womanSelect), for: .touchUpInside)
        
        manbtn.addTarget(self, action: #selector(manSelect), for: .touchUpInside)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //return 버튼 누르면 키보드 내려갈수있게 설정.
    }
    
    @IBAction func nextPage(_ sender: Any) {
        
        
        var idText = id.text!
        var password = pwd.text!
        
       // var email = name + "@naver.com"
        
        DataManager.sharedManager.setId(id: idText)
        DataManager.sharedManager.setPwd(pwd: password)
        DataManager.sharedManager.setName(name: name.text!)
        
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignUpScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "SignUpSecondVC") as! SignUpSecondVC
        
//        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func camera(_ sender: Any) {
        let alert =  UIAlertController(title: "너를보여줘!", message: "인생사진 어때?", preferredStyle: .actionSheet)
        
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    @objc func cancelEvent(){
          
          self.dismiss(animated: true, completion: nil)
      }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        else{
            print("Camera not available")
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                
        if textField == name {
            age.becomeFirstResponder()
        }
        else if textField == age {
            id.becomeFirstResponder()
        }
        else if textField == id {
            pwd.becomeFirstResponder()
        }
        else if textField == pwd {
            uni.becomeFirstResponder()
        }else if textField == uni {
            major.becomeFirstResponder()
        }
        else if textField == major {
            kakao.becomeFirstResponder()
        }
        else if textField == kakao {
            kakao.resignFirstResponder()
        }
        
        return true
        
    }
    
    
    
    
    func navigationSetup() { //네비게이션 투명색만들기
        
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        
        
        
    }
    
    @objc func womanSelect() {
        womanSelected = true
        manSelected = false
    }
    @objc func manSelect() {
        womanSelected = false
        manSelected = true
        
    }
}


//func navigationSetup() { //네비게이션 투명색만들기
//
//    //        rgb 255 126 39
//
//    //        self.navigationItem.backBarButtonItem?.tintColor = .black
//    //투명하게 만드는 공식처럼 기억하기
//
//
//
//    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//
//    self.navigationController?.navigationBar.isTranslucent = true
//
//    self.navigationController?.view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
//    //shadowImage는 UIImage와 동일. 구분선 없애줌.
//
//    //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 255/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)]
//    //        navigationController?.navigationBar.titleTextAttributes = textAttributes
//
//
//
//    //        navigationController?.navigationBar.titleTextAttributes = textAttributes
//
//    //        self.navigationController?.navigationBar.topItem?.title = "Home"
//    //  let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 211/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)]
//    //        navigationController?.navigationBar.titleTextAttributes = textAttributes
//
//}



extension SignUpFirstViewController : UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    func imagePickerController(_ _picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedimg.image = image
            
        }
        
        dismiss(animated: true)
    }
}
