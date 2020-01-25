//
//  MatchingCompleteViewController.swift
//  Mobo_iOS
//
//  Created by 천유정 on 02/01/2020.
//  Copyright © 2020 조경진. All rights reserved.
//

import UIKit

class MatchingCompleteViewController: UIViewController {

    
    @IBOutlet weak var date: UILabel!
    
    var reservationInfo = DataManager.sharedManager.getReservation()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        Thread.sleep(forTimeInterval: 3) //1초만 재우기

        
        date.text = reservationInfo[0].date + "일" + String(describing: reservationInfo[0].times[1]) + "시"
        
    }
    
    
    
    @IBAction func goChatBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ChatWaiting", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BeforeChat") as! BeforeChattingViewController
       // vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext

        
//        self.navigationController?.pushViewController(vc, animated: true)
        self.show(vc, sender: nil)
        
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
