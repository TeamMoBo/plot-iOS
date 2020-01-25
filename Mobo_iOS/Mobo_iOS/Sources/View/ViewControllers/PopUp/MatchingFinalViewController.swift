//
//  MatchingFinalViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 02/01/2020.
//  Copyright © 2020 조경진. All rights reserved.
//

import UIKit

class MatchingFinalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   // AfterChatMatchingViewController
    @IBAction func yesbtn(_ sender: Any) {
        
        DataManager.sharedManager.setMatchingToggle(matchingToggle: false)
    
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "PopUpScreen", bundle: nil)
        
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "AfterChatMatchingViewController") as! AfterChatMatchingViewController

        vc.modalTransitionStyle = .crossDissolve
               vc.modalPresentationStyle = .overCurrentContext
               self.present(vc, animated: true, completion: nil)
        
    }
    //AfterChatMatchingFailViewController
    @IBAction func nobtn(_ sender: Any) {
        
        DataManager.sharedManager.setMatchingToggle(matchingToggle: false)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "PopUpScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "AfterChatMatchingFailViewController") as! AfterChatMatchingFailViewController
                   
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
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
