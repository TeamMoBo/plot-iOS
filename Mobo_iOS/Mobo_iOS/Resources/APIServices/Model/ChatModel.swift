//
//  ChatModel.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/24.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class ChatModel: NSObject {
    
    public var users :Dictionary<String,Bool> = [:] //채팅방에 참여한 사람들
       public var comments :Dictionary<String,Comment> = [:] //채팅방의 대화내용
       
       public class Comment{
           @objc public var uid : String?
           @objc public var message : String?
       }

}
