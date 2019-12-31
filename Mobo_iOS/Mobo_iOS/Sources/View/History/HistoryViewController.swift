//
//  HistoryViewController.swiftHistory
//  Mobo_iOS
//
//  Created by 천유정 on 31/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var numberOfCell: Int = 4
    let cellIdentifier: String = "cell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.numberOfCell += 1
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
