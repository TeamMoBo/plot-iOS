//
//  TimeTableViewCell.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/28.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tableCollection: UICollectionView!
    @IBOutlet weak var dayLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
