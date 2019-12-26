//
//  ChatViewController.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/24.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textfield_message: UITextField!
    
    public var destinationUid :String? // 나중에 내가 채팅할 대상의 uid
    
    var uid : String?
    var chatRoomUid : String?
    var comments : [ChatModel.Comment] = []
    var userModel :UserModel?

    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(self.comments[indexPath.row].uid == uid){
            let view = tableView.dequeueReusableCell(withIdentifier: "MyMessageCell", for: indexPath) as! MyMessageCell
            view.label_message.text = self.comments[indexPath.row].message
            view.label_message.numberOfLines = 0
            return view
            
        }else{
            
            let view = tableView.dequeueReusableCell(withIdentifier: "DestinationMessageCell", for: indexPath) as! DestinationMessageCell
            view.label_name.text = userModel?.userName
            view.label_message.text = self.comments[indexPath.row].message
            view.label_message.numberOfLines = 0;
            
            let url = URL(string:(self.userModel?.profileImageUrl)!)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, err) in
                
                DispatchQueue.main.async {
                    
                    view.imageview_profile.image = UIImage(data: data!)
                    view.imageview_profile.layer.cornerRadius = view.imageview_profile.frame.width/2
                    view.imageview_profile.clipsToBounds = true
                    
                }
            }).resume()
            return view
            
        }
        
        
        
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func createRoom(){
        
        //       let createRoomInfo = [
        //            "uid":Auth.auth().currentUser?.uid,
        //            "destinationUid" : destinationUid
        //        ]
        //
        //        Database.database().reference().child("chatrooms").childByAutoId().setValue(createRoomInfo)
        
         let createRoomInfo : Dictionary<String,Any> = [ "users" : [
                   uid!: true,
                   destinationUid! :true
                   ]
               ]
               
               
               if(chatRoomUid == nil){
                   self.sendButton.isEnabled = false
                   // 방 생성 코드
                   Database.database().reference().child("chatrooms").childByAutoId().setValue(createRoomInfo, withCompletionBlock: { (err, ref) in
                       if(err == nil){
                           self.checkChatRoom()
                       }
                   })
                   
               }else{
                   let value :Dictionary<String,Any> = [

                           "uid" : uid!,
                           "message" : textfield_message.text!
                   ]
                   
                   Database.database().reference().child("chatrooms").child(chatRoomUid!).child("comments").childByAutoId().setValue(value)
               }
    }
    
    func checkChatRoom(){
        
        //        Database.database().reference().child("chatrooms").queryOrdered(byChild: "users/"+uid!).queryEqual(toValue: true).observeSingleEvent(of: DataEventType.value,with: { (datasnapshot) in
        //            for item in datasnapshot.children.allObjects as! [DataSnapshot]{
        //               self.chatRoomUid = item.key
        //
        //            }
        //        })
        
        Database.database().reference().child("chatrooms").queryOrdered(byChild: "users/"+uid!).queryEqual(toValue: true).observeSingleEvent(of: DataEventType.value,with: { (datasnapshot) in
            for item in datasnapshot.children.allObjects as! [DataSnapshot]{
                
                if let chatRoomdic = item.value as? [String:AnyObject]{
                    
                    let chatModel = ChatModel(JSON: chatRoomdic)
                    if(chatModel?.users[self.destinationUid!] == true){
                        self.chatRoomUid = item.key
                        
                        self.sendButton.isEnabled = true
                        
                        self.getMessageList()
                    }
                }
                
                
                
            }
        })
        
    }
    
    func getDestinationInfo(){
        
        Database.database().reference().child("users").child(self.destinationUid!).observeSingleEvent(of: DataEventType.value, with: { (datasnapshot) in
            self.userModel = UserModel()
            self.userModel?.setValuesForKeys(datasnapshot.value as! [String:Any])
           // self.getMessageList()
            self.getDestinationInfo()

        })
    }
    
    func getMessageList(){
//        Database.database().reference().child("chatrooms").child(self.chatRoomUid!).child("comments").observe(DataEventType.value, with: { (datasnapshot) in
//            self.comments.removeAll()
//
//            for item in datasnapshot.children.allObjects as! [DataSnapshot]{
//                let comment = ChatModel.Comment(JSON: item.value as! [String:AnyObject])
//                self.comments.append(comment!)
//            }
//            self.tableview.reloadData()
//
//
//
//        })
        Database.database().reference().child("chatrooms").child(self.chatRoomUid!).child("comments").observe(DataEventType.value, with: { (datasnapshot) in
                  self.comments.removeAll()
                  
                  for item in datasnapshot.children.allObjects as! [DataSnapshot]{
                      let comment = ChatModel.Comment(JSON: item.value as! [String:AnyObject])
                      self.comments.append(comment!)
                  }
                  self.tableview.reloadData()
                  
                  
                  
              })
              
    }
    
    
}

class MyMessageCell :UITableViewCell{
    
    @IBOutlet weak var label_message: UILabel!
}

class DestinationMessageCell :UITableViewCell{
    
    @IBOutlet weak var label_message: UILabel!
    @IBOutlet weak var imageview_profile: UIImageView!
    
    @IBOutlet weak var label_name: UILabel!
}
