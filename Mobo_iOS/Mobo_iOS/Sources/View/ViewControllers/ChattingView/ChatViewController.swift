//
//  ChatViewController.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/24.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textfield_message: UITextField!
    
    public var destinationUid :String? // 나중에 내가 채팅할 대상의 uid
    
    var uid : String?
    var chatRoomUid : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uid = Auth.auth().currentUser?.uid
        sendButton.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        checkChatRoom()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func createRoom(){
        
        let createRoomInfo : Dictionary<String,Any> = [ "users" : [
            
                       uid!: true,
                       destinationUid! : true
                       ]
                   ]
                   
                   if(chatRoomUid == nil){
                   Database.database().reference().child("chatrooms").childByAutoId().setValue(createRoomInfo)
                   }else{
                       let value: Dictionary<String,Any> = [
                           "comments":[
                               "uid" : uid!,
                               "messaage" : textfield_message.text!
                           ]
                       ]
                       Database.database().reference().child("chatrooms").child(chatRoomUid!).child("comments").childByAutoId().setValue(value)
                   }
               
        
    }
    
    func checkChatRoom(){
        
        Database.database().reference().child("chatrooms").queryOrdered(byChild: "users/"+uid!).queryEqual(toValue: true).observeSingleEvent(of: DataEventType.value,with: { (datasnapshot) in
            for item in datasnapshot.children.allObjects as! [DataSnapshot]{
               self.chatRoomUid = item.key
                
            }
        })
        
    }
    

}
