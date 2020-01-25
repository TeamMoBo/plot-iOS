
//  MovieTab.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class MovieTimeTableViewController: UIViewController {
    
    @IBOutlet var dayButtons: [UIButton]!
    @IBOutlet var TimeButtons: [UIButton]!
    @IBOutlet weak var TableView: UIView!
    @IBOutlet weak var OKButton: UIButton!
    
    //    @IBOutlet weak var tableView: UIView!
    //    @IBOutlet weak var OkBtn: UIButton!
    
    //    "reserveDate": [
    //        {
    //            "reservationDate": “2019-12-30“,
    //            "reservationTime": [11, 13, 15]
    //        },
    //        {
    //            "reservationDate": “2019-12-31”,
    //            "reservationTime": [17, 19, 20]
    //        }
    //    ]
    
   // MARK: - properties
    private var reservationInfo: DataManager.ReservationInfo? // 현재 선택한 날짜에 대한 예약 정보
        
        private var selectedIndex: Int = 0
        private let times: [Int] = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1, 2]
       
    var isRevise: Bool = false

        override func viewDidLoad() {
            super.viewDidLoad()
                       
            dayButtons.forEach {
                // 날짜 버튼 뷰 속성 설정
                $0.makeRounded(cornerRadius: 10)
                
                $0.setTitleColor(.white, for: .normal)
                $0.setBackgroundColor(.clear, for: .normal)
                
                $0.setTitleColor(.mainOrange, for: .selected)
                $0.setBackgroundColor(.white, for: .selected)
                // 날짜 버튼 클릭 이벤트 설정
                $0.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
            }
            
            TimeButtons.forEach {
                // 날짜 버튼 뷰 속성 설정
                $0.makeRounded(cornerRadius: 5)
                $0.setBorder(borderColor: .borderGray, borderWidth: 1)
                $0.dropShadow(color: .borderGray, offSet: CGSize(width: 1.0, height: 1.0), opacity: 0.7, radius: 5)
                
                $0.setTitleColor(.black, for: .normal)
                $0.setTitleColor(.white, for: .selected)
                // 날짜 버튼 클릭 이벤트 설정
                $0.addTarget(self, action: #selector(timeClick), for: .touchUpInside)
            }
            
            TableView.makeRounded(cornerRadius: 20)
            OKButton.titleEdgeInsets.bottom = 7
            
            // 초기 날짜 및 시간 선택
            if let reservationInfo = self.reservationInfo {
                                      DataManager.sharedManager.setReservation(info: reservationInfo)
                                  }
            
            selectDate("30") // 임시
            selectDayButton(at: selectedIndex)
            selectTimeButtons(times: reservationInfo!.times)
        }
        
    
    @IBAction func findFriendBtn(_ sender: Any) {
        
        DataManager.sharedManager.setMatching(toggle: true)
        self.navigationController?.popToRootViewController(animated: true)
    
    }
    
        /// 날짜 선택
        private func selectDate(_ date: String) {
            // 이전 날짜의 예약 정보 저장
            
            if let reservationInfo = self.reservationInfo {
                DataManager.sharedManager.setReservation(info: reservationInfo)
            }
  
            if let info = DataManager.sharedManager.reservationCache.first(where: { $0.date == date}) {
                // 캐시에 저장된 예약정보가 있다면 불러옴
                reservationInfo = info
            } else {
                // 캐시에 저장된 정보가 없다면 새로운 예약 정보를 생성
                reservationInfo = DataManager.ReservationInfo(date: date , times: [])
            }
        }
        
        /// 시간 선택
        private func selectTime(_ time: Int) {
            if let reservationInfo = self.reservationInfo {
                           DataManager.sharedManager.setReservation(info: reservationInfo)
                       }
                    
            if let index = reservationInfo!.times.firstIndex(of: time) {
                /// 선택한 시간이 존재한다면 삭제
                reservationInfo!.times.remove(at: index)
            } else {
                /// 선택한 시간이 없다면 추가
                reservationInfo!.times.append(time)
            }
        }
        
        /// 시간 정보를 통해 시간 버튼 활성화
        private func selectTimeButtons(times: [Int]) {
            
            // 모든 시간 버튼 선택 해제
            TimeButtons.forEach { setTimeButtonSelect($0, false) }
            
            times.compactMap { self.times.firstIndex(of: $0) }
                .map { TimeButtons[$0] }
                .forEach { setTimeButtonSelect($0, true) }
        }
        
        /// 시간 버튼 상태 설정
        private func setTimeButtonSelect(_ button: UIButton, _ isSelected: Bool) {
            button.isSelected = isSelected
            button.backgroundColor = isSelected ? .mainOrange : .white
            button.setBorder(borderColor: isSelected ? .clear : .borderGray, borderWidth: 1)
        }
        
        /// 날짜 버튼 선택
        private func selectDayButton(at index: Int) {
           
    
            guard (0 ..< dayButtons.count).contains(index) else { return }
                        
            dayButtons[selectedIndex].isSelected = false // 이전 날짜 선택 취소
            dayButtons[index].isSelected = true // 새로운 날짜 선택
            
            selectedIndex = index
        }
        
        /// 시간 버튼 선택
        private func selectTimeButton(at index: Int) {
            guard (0 ..< TimeButtons.count).contains(index) else { return }
            
            // 시간 버튼 토글
            let button = TimeButtons[index]
            setTimeButtonSelect(button, !button.isSelected)
        }
        
        // MARK: - selector
        @objc func dayClick(sender: UIButton) {
            guard let day = sender.titleLabel?.text else { return }
            
            if let reservationInfo = self.reservationInfo {
                           DataManager.sharedManager.setReservation(info: reservationInfo)
                       }
                    
            selectDate(day)
            selectDayButton(at: sender.tag - 1)
            selectTimeButtons(times: reservationInfo!.times)
        }
        
        @objc func timeClick(sender: UIButton) {
            guard let index = TimeButtons.firstIndex(of: sender) else { return }
            
            selectTime(times[index])
            selectTimeButton(at: sender.tag - 1)
        }
    }

    extension UIButton {
        func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
            UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
            
            let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self.setBackgroundImage(backgroundImage, for: state)
        }
    }
