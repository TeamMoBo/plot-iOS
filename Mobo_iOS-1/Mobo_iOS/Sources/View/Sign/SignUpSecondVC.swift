//
//  SignUpSecondVC.swift
//  Mobo_iOS
//
//  Created by 천유정 on 29/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//
import Foundation
import UIKit

protocol ToolbarPickerViewDelegate: class {
    func didTapDone()
    func didTapCancel()
    
    
    }
protocol ToolbarPickerViewDelegate2: class {

func didTapDone2()
func didTapCancel2()

}

class ToolbarPickerView: UIPickerView {
    
    public private(set) var toolbar: UIToolbar?
    public weak var toolbarDelegate: ToolbarPickerViewDelegate?
    
    public private(set) var toolbar2: UIToolbar?
    public weak var toolbarDelegate2: ToolbarPickerViewDelegate2?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        self.commonInit2()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        self.commonInit2()
    }
   
    
    private func commonInit() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.toolbar = toolBar
    }
    
    private func commonInit2() {
        let toolBar2 = UIToolbar()
        toolBar2.barStyle = UIBarStyle.default
        toolBar2.isTranslucent = true
        toolBar2.tintColor = .black
        toolBar2.sizeToFit()
        
        let doneButton2 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped2))
        let spaceButton2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton2 = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped2))
        
        toolBar2.setItems([cancelButton2, spaceButton2, doneButton2], animated: false)
        toolBar2.isUserInteractionEnabled = true
        
        self.toolbar2 = toolBar2
    }
    
    @objc func doneTapped() {
        self.toolbarDelegate?.didTapDone()
    }
    
    @objc func cancelTapped() {
        self.toolbarDelegate?.didTapCancel()
    }
    @objc func doneTapped2() {
           self.toolbarDelegate2?.didTapDone2()
       }
       
       @objc func cancelTapped2() {
           self.toolbarDelegate2?.didTapCancel2()
       }
}

class SignUpSecondVC: UIViewController, UITextFieldDelegate {
    
    
    
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
    
    @IBOutlet weak var genreHashTagTextField: HashTagTextField!
    @IBOutlet weak var charmHashTagTextField: HashTagTextField!
    @IBOutlet weak var interestHashTagTextField: HashTagTextField!
    
    
    fileprivate let pickerView = ToolbarPickerView()
    fileprivate let pickerView2 = ToolbarPickerView()
    fileprivate let titles = ["20","21","22","23","24","25",
                              "26","27","28","29","30","31",
                              "32"]
    fileprivate let values = ["20","21","22","23","24","25",
                              "26","27","28","29","30","31",
                              "32"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shortletter.delegate = self;
        
        womanbtn.addTarget(self, action: #selector(womanSelect), for: .touchUpInside)
        
        manbtn.addTarget(self, action: #selector(manSelect), for: .touchUpInside)
        
        nomatterbtn.addTarget(self, action: #selector(nomatterSelect), for: .touchUpInside)
        
        
        
        genreHashTagTextField.delegate = self
        charmHashTagTextField.delegate = self
        interestHashTagTextField.delegate = self
        
        self.minAgeField.inputView = self.pickerView
        self.minAgeField.inputAccessoryView = self.pickerView.toolbar
        
        self.maxAgeField.inputView = self.pickerView2
        self.maxAgeField.inputAccessoryView = self.pickerView2.toolbar
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.toolbarDelegate = self
        
        self.pickerView.reloadAllComponents()
        
        self.pickerView2.dataSource = self
        self.pickerView2.delegate = self
        self.pickerView2.toolbarDelegate = self
        self.pickerView2.reloadAllComponents()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.minAgeField.endEditing(true)
        self.maxAgeField.endEditing(true)
        view.endEditing(true)
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
    
    
    
    @IBAction func nextbtn(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignUpScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "SignUpLastViewController") as! SignUpLastViewController
        
        vc.modalPresentationStyle = .fullScreen
        self.show(vc, sender: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        shortletter.resignFirstResponder()
        genreHashTagTextField.resignFirstResponder()
        charmHashTagTextField.resignFirstResponder()
        interestHashTagTextField.resignFirstResponder()
        
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
    
    
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField is HashTagTextField {
            if checkHashTagCount(text: textField.text ?? "") {
                textField.deleteBackward()
            }
        }
    }
    
    func checkHashTagCount(text: String) -> Bool {
        var count: Int = 0
        for v in text {
            if v == "#" {
                count += 1
            }
        }
        return count > 3 ? true : false
    }
    
    
    
}

extension SignUpSecondVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.titles.count
    }
    func pickerView2(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return self.values.count
       }
       
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.titles[row]
        
    }
    func pickerView2(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.values[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.minAgeField.text = self.titles[row]
        
    }
    func pickerView2(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.maxAgeField.text = self.values[row]
        
    }
}

extension SignUpSecondVC: ToolbarPickerViewDelegate {
    
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        self.minAgeField.text = self.titles[row]
        self.minAgeField.resignFirstResponder()
        
        
        
        
    }
    func didTapDone2() {
           let row = self.pickerView2.selectedRow(inComponent: 0)
           self.pickerView2.selectRow(row, inComponent: 0, animated: false)
           self.maxAgeField.text = self.values[row]
           self.maxAgeField.resignFirstResponder()
       }
    
    func didTapCancel() {
        self.minAgeField.text = nil
        self.minAgeField.resignFirstResponder()
        
    }
    func didTapCancel2() {
        self.maxAgeField.text = nil
        self.maxAgeField.resignFirstResponder()
    }
}







