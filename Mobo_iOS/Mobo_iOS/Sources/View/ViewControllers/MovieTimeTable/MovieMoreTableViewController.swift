//
//  MoviewTabOne.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class MovieMoreTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    
    
    var dummyDay = [Int]()
    var dummyDate1 = [String]()
    var dummyDate2 = [String]()
    var dummyDate3 = [String]()
    
    //시간표에서 받아온 데이터 뷰
    var currentIndex: Int?
    var reserveDate: [reserveDateInfo] = []
    private var reservationInfo: [DataManager.ReservationInfo] = [] // 현재 선택한 날짜에 대한 예약 정보

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dummyDay = [17,18,19,20,21,22,23,24,25]
        
        dummyDate1 = ["12:00","13:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00"]
        dummyDate2 = ["12:00","13:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00",
                      "12:00","13:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00"]
        dummyDate3 = ["12:00","13:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00",
                      "12:00","13:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00",
                      "12:00","13:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00"]
        
        containerView.makeRounded(cornerRadius: 10)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func timeRevise(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}

extension MovieMoreTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        reservationInfo = DataManager.sharedManager.getReservation()
        
        
        if !reservationInfo.isEmpty {
            return reservationInfo.count
        }
        return 7
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // print("==============")
        let dataCount = 10
        // print(dataCount)
        let lineCount = (dataCount % 4 == 0) ? (dataCount / 4) : (dataCount / 4 + 1)
        //  print(lineCount)
        let collectionViewHeight: CGFloat = CGFloat(lineCount * 30 + (lineCount - 1) * 4 + 6 + 6)
        //  print(collectionViewHeight)
        let height = collectionViewHeight + 29 + 16
        //  print(height)
        //  print("==============")
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TimeTableViewCell
        
        cell.dayLabel.textColor = .mainOrange
      //  cell.dayLabel.text = String(describing: dummyDay[indexPath.row])
        
        if reservationInfo == nil {
            print(String(describing: reservationInfo[indexPath.row].date))
            //날짜 텍스트가 들어가는 곳이지만 이 조건문에 들어가지 않습니다!
        cell.dayLabel.text =  String(describing: reservationInfo[indexPath.row].date)
        }
        else {
            cell.dayLabel.text =  String(describing: "")

        }
        
        return cell
        
    }
    
}


extension MovieMoreTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(reservationInfo.count)
        return reservationInfo.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCollectionCell", for: indexPath) as! TimeCollectionViewCell
        
        
        cell.makeRounded(cornerRadius: 5)
        cell.setBorder(borderColor: .borderGray, borderWidth: 1)
        
        reservationInfo = DataManager.sharedManager.getReservation()
        
        
        //시간대가 들어가야 하는 컬렉션 뷰 입니다!
        if reservationInfo == nil {
            //여기로 들어가지가 않습니다!
            print(String(describing: reservationInfo[indexPath.row].times))

        }
        else {
            //무조건 여기로 빠집니다
            print(String(describing: reservationInfo[indexPath.row].times))

        }
                                     
        

        cell.currentIndex = indexPath.item
     
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = self.view.frame.width - 79 - 20
        let width: CGFloat = (collectionViewWidth - 4 - 4 - 4 * 3) / 4
        let height: CGFloat = 30
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
    }
    
    
    
}


