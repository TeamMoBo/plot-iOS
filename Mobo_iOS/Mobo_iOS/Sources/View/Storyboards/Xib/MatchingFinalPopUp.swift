
//  LatePopUp.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/28.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class MatchingFinalPopUp: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commoninit() {
        
        Bundle.main.loadNibNamed("MatchingPopUp", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth ]
        
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        print(1)
        view.removeFromSuperview()
    }
    
}
