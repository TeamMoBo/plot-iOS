//
//  SignUpSecondVC.swift
//  Mobo_iOS
//
//  Created by 천유정 on 29/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit



class SignUpSecondVC: UIViewController, UITextFieldDelegate , UIPickerViewDelegate , UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var womanimg: UIImageView!
    @IBOutlet weak var manimg: UIImageView!
    @IBOutlet weak var nomatterimg: UIImageView!
    
    @IBOutlet weak var womanbtn: UIButton!
    @IBOutlet weak var manbtn: UIButton!
    @IBOutlet weak var nomatterbtn: UIButton!
    
    @IBOutlet weak var letter: UITextField!
    
    @IBOutlet weak var shortletter: UITextField!
    @IBOutlet weak var minAgeField: UITextField!
    @IBOutlet weak var maxAgeField: UITextField!
    
    lazy var pickerView: UIPickerView = { // Generate UIPickerView.
        let picker = UIPickerView() // Specify the size.
        picker.frame = CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 180.0)
        picker.backgroundColor = .lightGray
        picker.delegate = self
        picker.dataSource = self
        return picker }()
    
    lazy var pickerView2: UIPickerView = { // Generate UIPickerView.
    let picker = UIPickerView() // Specify the size.
    picker.frame = CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 180.0)
    picker.backgroundColor = .lightGray
    picker.delegate = self
    picker.dataSource = self
    return picker }()
    
    let values: [String] = ["20","21","22","23","24","25",
    "26","27","28","29","30","31",
    "32"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shortletter.delegate = self as? UITextFieldDelegate
        
        womanbtn.addTarget(self, action: #selector( getter: womanSelected ), for: .touchUpInside)
        
        manbtn.addTarget(self, action: #selector( getter: manSelected ), for: .touchUpInside)
        
        nomatterbtn.addTarget(self, action: #selector( getter: nomatterSelected ), for: .touchUpInside)
        
        minAgeField.inputView = pickerView
        maxAgeField.inputView = pickerView2
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.minAgeField.endEditing(true)
        self.maxAgeField.endEditing(true)
           //return 버튼 누르면 키보드 내려갈수있게 설정.
       }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
        
    } // A method called when the picker is selected.
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if  minAgeField.isEditing {
        print("row: \(row)")
        print("value: \(values[row])")
            minAgeField.text! = values[row]
        }
        
        if maxAgeField.isEditing {
            print("row: \(row)")
            print("value: \(values[row])")
            maxAgeField.text! = values[row]
        }
        
        
    }
    
    
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
        
        shortletter.delegate = self;
        
        womanbtn.addTarget(self, action: #selector(womanSelect), for: .touchUpInside)
        
        manbtn.addTarget(self, action: #selector(manSelect), for: .touchUpInside)
        
        nomatterbtn.addTarget(self, action: #selector(nomatterSelect), for: .touchUpInside)
        
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
    
    
    @IBAction func nextbtn(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignUpScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "SignUpLastViewController") as! SignUpLastViewController
        
        vc.modalPresentationStyle = .fullScreen
        self.show(vc, sender: nil)
    }
    
    
    
}




    
    
    
    

