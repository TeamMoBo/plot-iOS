//
//  TimeCollectionViewCell.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/28.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit


protocol toggleActionDelegate {
    
    func didClicked()
    
}

class TimeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var timeButton: UIButton!
    
    var currentIndex: Int?
    var delegate : toggleActionDelegate?
    
    
    
     @IBAction func didClicked(_ sender: Any) {
        
            self.delegate?.didClicked()
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timeButton.isSelected = false
        
        // ImageThumbnail.makeRounded(cornerRadius: 10)
    }
    
}
