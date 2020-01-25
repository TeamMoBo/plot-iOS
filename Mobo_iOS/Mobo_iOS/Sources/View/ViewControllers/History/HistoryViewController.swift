//
//  HistoryViewController.swiftHistory
//  Mobo_iOS
//
//  Created by 천유정 on 31/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

protocol matchingLinkDelegate {
    
    func didClicked()
    
}

class HistoryViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate {
    
   
    
 
    
    var numberOfCell: Int = 1
    let cellIdentifier: String = "cell"
    private var reservationInfo: [DataManager.ReservationInfo] = [] // 현재 선택한 날짜에 대한 예약 정보

    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    var delegate: matchingLinkDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        
        
        
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 16
        flowLayout.minimumLineSpacing = 16
        flowLayout.estimatedItemSize = CGSize( width: 334, height: 166 )
        self.collectionview.collectionViewLayout = flowLayout
        
        
        
        
    }
    
    @IBAction func matchingHistoryBtn(_ sender: Any) {
        
        self.delegate?.didClicked()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! HistoryCollectionViewCell
        
        
          reservationInfo = DataManager.sharedManager.getReservation()
                
        //        if reservationInfo[0].date == nil {
        //            cell.date.text = "2019/12/30"
        //        }
        //        else {
                
        //            cell.date.text = reservationInfo[0].date
                 cell.date.text = "2019/12/30"
                
        //        }
                
                self.delegate = self

                
                return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegate = self

        collectionView.reloadData()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    func navigationSetup() {
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
    }
    
    
}

extension HistoryViewController: matchingLinkDelegate {
    //BeforeChattingViewController
    //BeforeChat
    
    func didClicked() {
    
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "History", bundle: nil)
                let vc = mainStoryboard.instantiateViewController(withIdentifier: "HistoryDetailVC") as! HistoryDetailVC
                
        //        vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.navigationController?.pushViewController(vc, animated: true)
    }
}
