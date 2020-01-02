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
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    // @IBOutlet weak var bottomTextFieldConstraint: NSLayoutConstraint!
    
    public var destinationUid :String? // 나중에 내가 채팅할 대상의 uid
    
    var uid : String?
    var chatRoomUid : String?
    var comments : [ChatModel.Comment] = []
    var userModel :UserModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview.backgroundColor = UIColor.init(red: 246 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1)
        
        uid = Auth.auth().currentUser?.uid
        sendButton.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        checkChatRoom()
        self.tabBarController?.tabBar.isHidden = true
        let tap :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setupGestureRecognizer()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name:  UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //종료
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    
    
    private func setupGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let height = keyboardSize.height - view.safeAreaInsets.bottom
        
        
        //하단 채팅 보내는 뷰의 bottom Constraint이야!
        //위에서 계산한 높이값만큼 contant값을 넣어 주는 것.. 이건 당연 알겠지
        self.bottomConstraint.constant = height
        
        //이건 이제 키보드가 올라오면 테이블뷰의 안의 콘텐트 인셋을 위에서 계산된 height값으로 줘버리는거야
        //그럼 키보드가 올라올때 그만큼 인셋이 생겨서 슝하고 올라감
        //물론 scrollToRow로 제일 아래로 테이블뷰 위치 옮기는거 같이 써서ㅋ
        self.tableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
        
        let item = comments.count - 1
        print(item)
        if !(item < 0) {
            self.tableview.scrollToRow(at: IndexPath(item: comments.count - 1, section: 0), at: .bottom, animated: false)
        }
        // animate되는 값이 아닌데 animate하려면 위에서 값 세팅하고 아래처럼 하라고 하더라고zz (feat. stackoverflow)
        self.view.setNeedsLayout()
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    //    @objc func keyboardWillShow(notification : Notification){
    //
    //        if let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
    //
    //            self.bottomConstraint.constant = keyboardSize.height - 35
    //
    //        }
    //           UIView.animate(withDuration: 0, animations: {
    //               self.view.layoutIfNeeded()
    //
    //           }, completion: {
    //               (complete) in
    //
    //               if self.comments.count > 0{
    //                self.tableview.scrollToRow(at: IndexPath(item:self.comments.count - 1,section:0), at: UITableView.ScrollPosition.bottom, animated: true)
    //
    //               }
    //
    //
    //           })
    //       }
    //
    
    @objc func keyboardWillHide(notification:Notification){
        
        self.bottomConstraint.constant = 0
        //self.bottomTextFieldConstraint.constant = 64
        
        self.view.layoutIfNeeded()
        
    }
    
    @objc func dismissKeyboard(){
        
        self.view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let chat = comments[indexPath.row]
        
        //이 appro어쩌구 값이 label의 width 최대 값이라고 생각하면되는데
        //왼쪽 오른쪽 마진이 나의 메세지이든 상대방 메세지이든 스토리보드에 보면 16하고 32로 설정되어있어. 그래서 아래 값을 저렇게 해준거임.
        let approximateWidthOfText = view.frame.width - 32 - 15
        
        let size = CGSize(width: approximateWidthOfText, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        let estimatedFrame = NSString(string: chat.message!).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        // 이제 이건 순수 레이블의 height 값에다가 위아래 마진 값 16을 더했고
        // 여분으로 4포인트 정도를 더 줘서 텍스트가 레이블안에서 안짤리도록 한 것!
        // 저 총합의 값들이 한 셀의 높이가 되는겁니당
        return estimatedFrame.height + 16 + 4
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(self.comments[indexPath.row].uid == uid) {
            let view = tableView.dequeueReusableCell(withIdentifier: "MyMessageCell", for: indexPath) as! MyMessageCell
            
            view.selectionStyle = .none
            
            view.label_message.text = self.comments[indexPath.row].message
            return view
            
        }else{
            
            let view = tableView.dequeueReusableCell(withIdentifier: "DestinationMessageCell", for: indexPath) as! DestinationMessageCell
            
            view.selectionStyle = .none
            
            view.label_name.text = userModel?.userName
            view.label_message.text = self.comments[indexPath.row].message
            
            let url = URL(string:("https://user-images.githubusercontent.com/46750574/67218949-32564e00-f462-11e9-9852-6c68178f9810.png"))
            
            // let url = URL(string:(self.userModel?.profileImageUrl)!)
            
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
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //
    //        return UITableView.automaticDimension
    //
    //    }
    
    
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
            
            //                   Database.database().reference().child("chatrooms").child(chatRoomUid!).child("comments").childByAutoId().setValue(value)
            Database.database().reference().child("chatrooms").child(chatRoomUid!).child("comments").childByAutoId().setValue(value, withCompletionBlock: { (err, ref) in
                self.textfield_message.text = ""
            })
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
            print(self.chatRoomUid!)

            
            
            for item in datasnapshot.children.allObjects as! [DataSnapshot]{
                let comment = ChatModel.Comment(JSON: item.value as! [String:AnyObject])
                self.comments.append(comment!)
                print(self.comments)
            }
            
            self.tableview.reloadData()
            self.tableview.scrollToRow(at: IndexPath(item: self.comments.count - 1, section: 0), at: .bottom, animated: false)
            
            
            
        })
        
    }
    
    
}






class MyMessageCell :UITableViewCell{
    
    @IBOutlet weak var label_message: UILabel!
    @IBOutlet weak var ChatView1: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //label_message.backgroundColor = .red
        //label_message.roundCorners(corners: [.topRight , .bottomRight, .bottomLeft], radius: 15)
               
        ChatView1.roundCorners(cornerRadius: 10 , corners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        ChatView1.dropShadow(color: .lightGray, offSet: CGSize(width: 1, height: 1), opacity: 0.7, radius: 5)

    }
    

   
}

class DestinationMessageCell : UITableViewCell{
    
    @IBOutlet weak var label_message: UILabel!
    @IBOutlet weak var imageview_profile: UIImageView!
    
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var ChatView2: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //label_message.backgroundColor = .red
        //label_message.roundCorners(corners: [.topRight , .bottomRight, .bottomLeft], radius: 15)
        
        ChatView2.roundCorners(cornerRadius: 10 , corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        ChatView2.dropShadow(color: .lightGray, offSet: CGSize(width: 0.7, height: 0.7), opacity: 0.5, radius: 5)

        
        
    }
    
    
}


extension UIView {
    
    func roundCorners(cornerRadius: Double , corners: CACornerMask) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = corners
    }
    

}
