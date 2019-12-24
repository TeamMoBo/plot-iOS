import UIKit
import SnapKit
import Firebase

class ChattingPeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var array :  [UserModel] = []
    var tableview : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (m) in
            m.top.equalTo(view).offset(20)
            m.bottom.left.right.equalTo(view)
        }
        
            Database.database().reference().child("users").observe(DataEventType.value, with: { (snapshot) in
                
            
                self.array.removeAll()
                
                for child in snapshot.children {
                    
                    print(snapshot.children)
                    
                    let fchild = child as! DataSnapshot
                    let userModel = UserModel()
                    
                    userModel.setValuesForKeys(fchild.value as! [String : Any])
                    self.array.append(userModel)
                    
                }
                
                DispatchQueue.main.async {
                    self.tableview.reloadData();
                }
                
        })
            
        
        
        // Do any additional setup after loading the view.
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for :indexPath)
        
        let imageview = UIImageView()
//        imageview.image = #imageLiteral(resourceName: "img1")
        cell.addSubview(imageview)
        imageview.snp.makeConstraints{(m) in
            m.centerY.equalTo(cell)
            m.left.equalTo(cell)
            m.height.width.equalTo(50)
        }
        
//        URLSession.shared.dataTask(with: URL(string: array[indexPath.row].profileImageUrl!)!) { (data, response, err) in
//            
//            DispatchQueue.main.async {
//                imageview.image = UIImage(data: data!)
//                imageview.layer.cornerRadius = imageview.frame.size.width/2
//                imageview.clipsToBounds = true
//            }
//        }.resume()
        
        let label = UILabel()
        cell.addSubview(label)
        label.snp.makeConstraints{ (m) in
            m.centerY.equalTo(cell)
            m.left.equalTo(imageview.snp.right).offset(30)
        }
        
        label.text = array[indexPath.row].userName
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
