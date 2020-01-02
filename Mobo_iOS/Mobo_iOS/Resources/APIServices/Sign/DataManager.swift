//
//  DataManager.swift
//  boxoffice
//
//  Created by Cho on 17/12/2018.
//  Copyright © 2018 Cho. All rights reserved.
//

import UIKit

class DataManager {
    
    static let sharedManager: DataManager = {
        let dm = DataManager()
        return dm
    }()
    
    struct ReservationInfo {
        
        var date: String
        var times: [Int]
    }
    
    private init() {
        
    }
    
    var reservationCache: [ReservationInfo] = []
    
    func setReservation(info : ReservationInfo) {
        
        guard let index = reservationCache.firstIndex(where: { $0.date == info.date}) else {
            self.reservationCache.append(info)
            return
        }
        reservationCache[index] = info
    }
    
    private var ticTimer: Timer? = nil
    private var ticNumber : Double = 0.0
    
    
    func getTimer() -> Timer {
        return ticTimer!
    }
    
    func setTimer(ticTimer : Timer) {
        self.ticTimer = ticTimer
    }
    
   
    
    
    private var id : String!
    private var pwd : String!
    private var name : String!
    
    func getName() -> String {
        return name
    }
    
    func setName(name : String) {
        self.name = name
    }
    
    func getId() -> String {
        return id
    }
    
    func getPwd() -> String {
        return pwd
    }

    func setId(id : String) {
        self.id = id
    }
    
    func setPwd(pwd : String) {
        self.pwd = pwd
    }
    
    private var haveImage: UIImage!
    
    func getImage() -> UIImage {
        return haveImage
    }
    func setImage(haveImage : UIImage) {
        self.haveImage = haveImage
    }
    
    private var haveTitle: String!
    
    func getTitle() -> String {
        return haveTitle
    }
    func setTitle(haveTitle : String) {
        self.haveTitle = haveTitle
    }
    
    private var haveDate: String!
    
    func getDate() -> String {
        return haveDate
    }
    func setDate(haveDate : String) {
        self.haveDate = haveDate
    }
    
    private var haveRating: Double!
    
    func getRating() -> Double {
        return haveRating
    }
    func setRating(haveRating : Double) {
        self.haveRating = haveRating
    }
    
    
    //For Not Do Many Networking Process
    private var didOrderTypeChangedAndDownloaded: Bool = false
    
    func setDidOrderTypeChangedAndDownloaded(_ state: Bool) {
        didOrderTypeChangedAndDownloaded = state
    }
    
    
    func getDidOrderTypeChangedAndDownloaded() -> Bool {
        return didOrderTypeChangedAndDownloaded
    }
    
    //Shared MovieOrderType
    private var movieOrderType: String = ""
    
    func setMovieOrderType(orderType: String) {
        movieOrderType = orderType
    }
    
    func getMovieOrderType() -> String {
        return "0"
    }
    
    //Shared MovieLists
    private var movieList: [movieInfo] = []
    private var reserveMovieList: [reserveMovieInfo] = []
    private var reserveDateList: [reserveDateInfo] = []
    private var movieTicketInfo: [TicketResponseString.TicketMovie.movieTicketInfo] = []
    
    
    
    
    
    func setMovieList(list: [movieInfo]) {
        movieList = list
    }
    
    func setReserveMovieList(list: [reserveMovieInfo]) {
        reserveMovieList = list
    }
    func setReserveDateList(list: [reserveDateInfo]) {
        reserveDateList = list
    }
    
    func setTicketingMoiveList(list: [TicketResponseString.TicketMovie.movieTicketInfo] ) {
        movieTicketInfo = list
    }
    
    
    func getMovieList() -> [movieInfo] {
        return movieList
    }
    func getReserveMovieList() -> [reserveMovieInfo] {
        return reserveMovieList
    }
    func getReserveDateList() -> [reserveDateInfo] {
        return reserveDateList
    }
    
    func getTicketingMoiveList() -> [TicketResponseString.TicketMovie.movieTicketInfo] {
        return movieTicketInfo
    }
}
