//
//  HistoryDetailVC.swift
//  Mobo_iOS
//
//  Created by 천유정 on 31/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class HistoryDetailVC: UIViewController {


    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var letter: UILabel!
    @IBOutlet weak var hashtags: UILabel!
    
    @IBOutlet weak var uni: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var kakaoid: UILabel!
    
    @IBOutlet weak var movietitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var theater: UILabel!
    @IBOutlet weak var seat: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        
    }
    
//    if DataManager.sharedManager.getMatching() {
//    
//    if !DataManager.sharedManager.getMatchingToggle() {
//    
    
    
    @IBAction func cancelbtn(_ sender: Any) {
        
        
        DataManager.sharedManager.setMatching(toggle: false)
        DataManager.sharedManager.setMatchingToggle(matchingToggle: false)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "MainNaviVC") as! UINavigationController
               vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
               
               self.show(vc, sender: nil)
    }
    
    func navigationSetup() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
    }
    
    
  

}
