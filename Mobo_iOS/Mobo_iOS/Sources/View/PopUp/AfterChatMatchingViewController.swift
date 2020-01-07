//
//  AfterChatMatchingViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 02/01/2020.
//  Copyright © 2020 조경진. All rights reserved.
//

import UIKit

class AfterChatMatchingViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkingbtn(_ sender: Any) {
        
        DataManager.sharedManager.setMatchingToggle(matchingToggle: false)
                     //   self.navigationController?.popViewController(animated: true)
                        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "History", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "HistoryDetailVC") as! HistoryDetailVC
          
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext

        self.show(vc, sender: nil)
                
        
       // self.present(vc, animated: true, completion: nil)
        
//        self.dismiss(animated: true, completion: nil)
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
