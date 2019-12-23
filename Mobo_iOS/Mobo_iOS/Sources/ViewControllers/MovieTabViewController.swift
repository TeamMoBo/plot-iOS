//
//  MovieTab.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class MovieTabViewController: TabmanViewController {
    
    
    let customNavi = UINavigationBar()
    
    private var viewControllers : [UIViewController] = []
    private var titleSet = ["현재 상영작", "개봉 예정작"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        topBarUISet()
        
                let navigationHeight = UIApplication.shared.statusBarFrame.height
                + self.navigationController!.navigationBar.frame.height
        
        customNavi.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: navigationHeight)
        customNavi.backgroundColor = .red
        
    }
    
    func setViewControllers(){
        guard let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "first") else {
            return
        }
    
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "second") else {
            return
        }
       
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        
        
    }
    
    
    //MARK: - TopBar생성
    func topBarUISet(){
        

        
        let bar = TMBar.ButtonBar()
       
      
        bar.backgroundView.style = .clear
        bar.layout.contentMode = .fit
        bar.layout.transitionStyle = .none
        bar.backgroundColor = .white
        bar.buttons.customize { (button) in
            button.tintColor = .orange
            button.selectedTintColor = .orange
        }
        bar.indicator.backgroundColor = .orange
        bar.scrollMode = .interactive
        
        //        bar.fadesContentEdges
        self.dataSource = self
        addBar(bar, dataSource: self, at: .top)
        
    }
    
}

//MARK: - TopBarDataSource
extension MovieTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = titleSet[index]
        return TMBarItem(title: title)
    }
    
}
