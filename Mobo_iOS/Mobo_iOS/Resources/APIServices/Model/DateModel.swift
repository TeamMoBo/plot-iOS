//
//  DateModel.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/30.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class DateModel: NSObject {
    
    var reservationCache: [ReservationInfo] = []

    struct ReservationInfo {
        
        var date: String
        var times: [Int]
    }

    
}

