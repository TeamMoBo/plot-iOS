//
//  MyPageViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 27/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController , UITextFieldDelegate {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var camera: UIButton!
    
    
    @IBOutlet weak var profilepic: UIImageView!
    @IBOutlet weak var selectedpic: UIImageView!
    
    @IBOutlet weak var agetext: UITextField!
    @IBOutlet weak var pwdtext: UITextField!
    @IBOutlet weak var kakaoidtext: UITextField!
    @IBOutlet weak var majortext: UITextField!
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var idtext: UITextField!
    @IBOutlet weak var placetext: UITextField!
    @IBOutlet weak var unitext: UITextField!
    
    @IBOutlet weak var ticketcount: UILabel!
    @IBOutlet weak var popcorncount: UILabel!
    
    
    @IBOutlet weak var womanbtn: UIButton!
    @IBOutlet weak var manbtn: UIButton!
    @IBOutlet weak var nomatterbtn: UIButton!
    
    @IBOutlet weak var womanimg: UIImageView!
    @IBOutlet weak var manimg: UIImageView!
    @IBOutlet weak var nomatterimg: UIImageView!
    
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
    var nomatterSelected: Bool = false {
        didSet {
            let image = nomatterSelected ? UIImage(imageLiteralResourceName: "icSelected") : UIImage(imageLiteralResourceName: "icUnselected")
            nomatterimg.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationSetup()

        

        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        
        agetext.delegate = self;
        nametext.delegate = self;
        kakaoidtext.delegate = self;
        unitext.delegate = self;
        placetext.delegate = self;
        idtext.delegate = self;
        majortext.delegate = self;
        pwdtext.delegate = self;
        
        womanbtn.addTarget(self, action: #selector(womanSelect), for: .touchUpInside)
        
        manbtn.addTarget(self, action: #selector(manSelect), for: .touchUpInside)
        
        nomatterbtn.addTarget(self, action: #selector(nomatterSelect), for: .touchUpInside)
    }
    
    
    
    
    
    
    
    @IBAction func camerabtn(_ sender: Any) {
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
    
    @IBAction func ticketboxbtn(_ sender: Any) {
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

    
    func navigationSetup() {
    }//네비게이션 투명색만들기


}

//extension MyPageViewController : UIImagePickerControllerDelegate,
//UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            selectedpic.image = image
//        }
//
//        dismiss(animated: true)
//    }
//
//
//}


//}




extension MyPageViewController : UIImagePickerControllerDelegate
{
    func imagePickerController(_ _picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedpic.image = image
            print(info)
        }
        
        dismiss(animated: true)
    }
    
}



