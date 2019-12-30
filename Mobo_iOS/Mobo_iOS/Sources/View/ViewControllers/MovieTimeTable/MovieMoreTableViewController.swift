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
    
    
    var date = Date()
    var cal = Calendar.current
    var currentIndex: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(date)
        
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
    
    
    
}

extension MovieMoreTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dummyDay.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // print("==============")
        let dataCount = dummyDate3.count
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
        cell.dayLabel.text = String(describing: dummyDay[indexPath.row])
        
        
        return cell
        
    }
    
    
    
}


extension MovieMoreTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return dummyDate3.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCollectionCell", for: indexPath) as! TimeCollectionViewCell
        
        
        cell.makeRounded(cornerRadius: 5)
        cell.setBorder(borderColor: .borderGray, borderWidth: 1)
        // cell.timeButton.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
        
        
        cell.timeButton.setTitle(dummyDate3[indexPath.row], for: .normal)
        
        cell.delegate = self
        cell.currentIndex = indexPath.item
        
        
        if cell.timeButton.isTouchInside {
            
            print(10)
            
            if (cell.timeButton.isSelected) == false {
                
                cell.timeButton.isSelected = true
                cell.timeButton.setTitleColor(.white, for: .normal)
                cell.timeButton.setBackgroundColor(.mainOrange, for: .normal)
                
                
                
            }
                
            else if cell.timeButton.isSelected
            {
                cell.timeButton.isSelected = false
                cell.timeButton.setTitleColor(.mainOrange, for: .normal)
                cell.timeButton.setBackgroundColor(.lightGray, for: .normal)
                //              cell.timeButton.makeRounded(cornerRadius: 5)
                cell.timeButton.clipsToBounds = true
                
                
            }
        }
        
        
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

extension MovieMoreTableViewController: toggleActionDelegate {
    
    
    
    func didClicked() {
        
        print(1010)
        
        
        
    }
    
    
}



