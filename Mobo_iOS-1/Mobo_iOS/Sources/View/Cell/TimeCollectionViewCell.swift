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
    
    override var isSelected: Bool {
        
        didSet {

            print(isSelected)
            let color: UIColor = isSelected ? .mainOrange : .lightGray
            let textColor: UIColor = isSelected ? .white : .black
            self.timeButton.setBackgroundColor(color, for: .normal)
            self.timeButton.setTitleColor(textColor, for: .normal)
        }
    }
    
     @IBAction func didClicked(_ sender: Any) {
        
            self.delegate?.didClicked()
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timeButton.isSelected = false
    }
    
}
