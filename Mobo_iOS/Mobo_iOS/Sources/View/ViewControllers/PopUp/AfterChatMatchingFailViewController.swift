
//
//  AfterChatMatchingFailViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 02/01/2020.
//  Copyright © 2020 조경진. All rights reserved.
//

import UIKit

class AfterChatMatchingFailViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotoMainbtn(_ sender: Any) {
        
        DataManager.sharedManager.setMatchingToggle(matchingToggle: false)
        DataManager.sharedManager.setMatching(toggle: false)
        //   self.navigationController?.popViewController(animated: true)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MainNaviVC") as! UINavigationController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
