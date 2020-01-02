//
//  APIServices.swift
//  Mobo_iOS
//
//  Created by 천유정 on 24/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}


