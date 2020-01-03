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

class MainHomeViewController: UIViewController {
    
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var deadlineTitle: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var bottomview: UIView!
    
    //@IBOutlet var bottomDayButtons: [UIButton]!
    //@IBOutlet var bottomTimeButtons: [UIButton]!
    
    @IBOutlet weak var bottomDay1 : UIButton!
    @IBOutlet weak var bottomDay2:  UIButton!
    @IBOutlet weak var bottomTime1: UIButton!
    @IBOutlet weak var bottomTime2: UIButton!
    @IBOutlet weak var bottomTime3: UIButton!
    @IBOutlet weak var bottomTime4: UIButton!
    @IBOutlet weak var bottomTime5: UIButton!
    @IBOutlet weak var bottomTime6: UIButton!
    @IBOutlet weak var bottomTime7: UIButton!
    @IBOutlet weak var noImageLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    
    
    
    private var reservationInfo: [DataManager.ReservationInfo] = [] // 현재 선택한 날짜에 대한 예약 정보
    
    var imgArr = [  UIImage(named:"10"),
                    UIImage(named:"10")]
    
    
    var mTimer:  Timer? = nil
    var number: Double = 0.0
    
    //    var movies: [Movie] = []
    var movieInfo : [movieInfo] = []
    var reservemovies: [reserveMovieInfo] = []
    var reserveDate: [reserveDateInfo] = []
    var movingMovie: [TicketResponseString.TicketMovie.movieTicketInfo] = []
    let movieListCellID: String = "MovieListCell"
    let mainListID: String = "mainCollectionViewCell"
    var selectedImage: UIImage!
    var selectedTitle: String!
    var selectedRating: Double!
    var selectedDate: String!
    let dataManager = DataManager.sharedManager
    let caLayer: CAGradientLayer = CAGradientLayer()
    

    private var selectedIndex: Int = 0
    private let times: [Int] = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1, 2]
    
    struct Storyboard {
        static let photoCell = "PhotoCell"
        static let showDetailVC = "ShowMovieDetail"
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        moreBtn.isHidden = true
        noImageLabel.isHidden = false
        view.backgroundColor = .groundColor
        setMovieListCollectionView()
        navigationSetup()
        bottomview.makeRounded(cornerRadius: 10)
        bottomview.dropShadow(color: .lightGray, offSet: CGSize(width: 1, height: 1), opacity: 0.7, radius: 5)
        sendButton.titleEdgeInsets.bottom = 10
        bottomDay1.tintColor = .mainOrange
        bottomDay2.tintColor = .mainOrange
        
    }
   
    
    
    @IBAction func buyBtn(_ sender: Any) {
        
        navigationSetup2()
        
        DataManager.sharedManager.setRevise(revise: false)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "MovieTabScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MovieSelectionViewController") as! MovieSelectionViewController

        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tictok(){
        if let timer = mTimer {
            //timer 객체가 nil 이 아닌경우에는 invalid 상태에만 시작한다
            if !timer.isValid {
                /** 1초마다 timerCallback함수를 호출하는 타이머 */
                mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            }
        }else{
            //timer 객체가 nil 인 경우에 객체를 생성하고 타이머를 시작한다
            /** 1초마다 timerCallback함수를 호출하는 타이머 */
            mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCallback(){
        number += 1
        // print(number)
        if number == 30 {
            
            //여기서 매칭 최종 선택 하는 팝업 띄우자!!!
            
            self.navigationController?.popViewController(animated: true)
          
        }
    }
    
    
    func getMovieList(completion: @escaping (ListResponse?) -> Void) {
        
        let appUrl: String = "http://13.125.48.35:7935/main"
        
        guard let finalURL = URL(string: appUrl) else {
            return
        }
        
        let session = URLSession(configuration: .default)
        
        var request = URLRequest(url: finalURL)
        
        
        request.addValue("application/x-www-form-urlencoded" , forHTTPHeaderField: "Content-Type")
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjQwLCJpYXQiOjE1Nzc5NDkzNDYsImV4cCI6MTU3ODU1NDE0NiwiaXNzIjoibW9ib21hc3RlciJ9.dwKFFXHdDhkb8WW25BSMyig5DFzUlKPQ-WE1lzO4JBc", forHTTPHeaderField: "authorization")
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let resultData = data else {
                return
            }
            
            do {
                //                String(bytes: <#T##Sequence#>, encoding: String.Encoding.utf8)
                //    print(String(data: data!, encoding: .utf8))
                let movieLists: ListResponse  = try JSONDecoder().decode(ListResponse.self, from: resultData)
                self.dataManager.setMovieList(list: movieLists.results.randMovie)
                self.dataManager.setReserveMovieList(list: movieLists.results.reserveMovie)
                self.dataManager.setReserveDateList(list: movieLists.results.reserveDate)
                self.dataManager.setDidOrderTypeChangedAndDownloaded(true)
                self.reloadMovieLists()
                completion(movieLists)
            }
            catch let error {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        reservationInfo = DataManager.sharedManager.getReservation()
        
        if !reservationInfo.isEmpty {
            
            moreBtn.isHidden = false
            bottomDay1.tintColor = .mainOrange
            bottomDay2.tintColor = .mainOrange
            
            
            bottomDay1.setTitle(reservationInfo[0].date, for: .normal)
            bottomDay2.setTitle(reservationInfo[1].date, for: .normal)

            

            bottomTime1.setTitle(String(describing: reservationInfo[0].times[0]) + ":00", for: .normal)
            bottomTime3.setTitle(String(describing: reservationInfo[0].times[1]) + ":00", for: .normal)
            bottomTime5.setTitle(String(describing: reservationInfo[0].times[2]) + ":00", for: .normal)

            bottomTime2.setTitle(String(describing: reservationInfo[1].times[0]) + ":00", for: .normal)
            bottomTime4.setTitle(String(describing: reservationInfo[1].times[1]) + ":00", for: .normal)
            bottomTime6.setTitle(String(describing: reservationInfo[1].times[2]) + ":00", for: .normal)
            
          //  bottomTime7.setTitle(String(describing: reservationInfo[1].times[3]) + ":00", for: .normal)
            
        }
        
        deadlineTitle.textColor = .subOrange
        
        
            
        if DataManager.sharedManager.getMatching() {
            
            if !DataManager.sharedManager.getMatchingToggle() {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "PopUpScreen", bundle: nil)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "MatchingCompleteViewController") as! MatchingCompleteViewController
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
            
            //            self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                
            }
        }
            
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        if dataManager.getDidOrderTypeChangedAndDownloaded() {
            print(2)
            reloadMovieLists()
        }
        else {
            print(3)
            reloadMovieLists()
            //            let orderType: String = dataManager.getMovieOrderType()
            //            getMovieList(orderType: orderType)
            getMovieList() { (listResponse) in
                guard let response = listResponse else {
                    return
                }
                
                //     print(response)
                
            }
        }
    }
    
  
    
    
    @IBAction func myPageBtn(_ sender: Any) {
        
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MyPageVC") as! MyPageViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    
    @IBAction func reviseButton(_ sender: Any) {
        
        navigationSetup1()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "선택한 날짜", style: .done, target: nil, action: nil)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "MovieTabScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MovieSelectionViewController") as! MovieSelectionViewController
                
        DataManager.sharedManager.setRevise(revise: true)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func addMoreBtn(_ sender: Any) {
        
        navigationSetup1()
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "MovieTabScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MovieMoreTableViewController") as! MovieMoreTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func HistoryBtn(_ sender: Any) {
        
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "홈", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .white
        //투명하게 만드는 공식처럼 기억하기
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //네비게이션바의 백그라운드색 지정. UIImage와 동일
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //shadowImage는 UIImage와 동일. 구분선 없애줌.
        self.navigationController?.navigationBar.isTranslucent = true
        
      //  self.navigationController?.navigationBar.topItem?.title = "매칭 이력"
        let storyboard = UIStoryboard(name: "ChatWaiting", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        self.show(vc, sender: nil)
        
    }
    
    func navigationSetup() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        //           self.navigationItem.backBarButtonItem?.tintColor = .white
        //투명하게 만드는 공식처럼 기억하기
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //네비게이션바의 백그라운드색 지정. UIImage와 동일
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //shadowImage는 UIImage와 동일. 구분선 없애줌.
        self.navigationController?.navigationBar.isTranslucent = true
        //false면 반투명이다.
        
        //뷰의 배경색 지정
        
        self.navigationController?.navigationBar.topItem?.title = "매칭이력"
        //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 211/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    func navigationSetup0() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = .mainOrange
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "마이 페이지", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .white
        //투명하게 만드는 공식처럼 기억하기
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //네비게이션바의 백그라운드색 지정. UIImage와 동일
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //shadowImage는 UIImage와 동일. 구분선 없애줌.
        self.navigationController?.navigationBar.isTranslucent = true
        //false면 반투명이다.
        
        //뷰의 배경색 지정
        
        //        self.navigationController?.navigationBar.topItem?.title = "Home"
        //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 211/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    
    func navigationSetup1() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = .mainOrange
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "선택한 날짜", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .white
        //투명하게 만드는 공식처럼 기억하기
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //네비게이션바의 백그라운드색 지정. UIImage와 동일
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //shadowImage는 UIImage와 동일. 구분선 없애줌.
        self.navigationController?.navigationBar.isTranslucent = true
        //false면 반투명이다.
        
        //뷰의 배경색 지정
        
        //        self.navigationController?.navigationBar.topItem?.title = "Home"
        //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 211/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    func navigationSetup2() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "영화 선택하기", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .white
        //투명하게 만드는 공식처럼 기억하기
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //네비게이션바의 백그라운드색 지정. UIImage와 동일
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //shadowImage는 UIImage와 동일. 구분선 없애줌.
        self.navigationController?.navigationBar.isTranslucent = true
        //false면 반투명이다.
        // self.navigationController?.navigationBar.topItem?.title = "영화 선택하기"
        // self.navigationController?.navigationBar.tintColor = .white
        
        
    }
    
   
    
    
    func reloadMovieLists() {
        
        self.movieInfo = dataManager.getMovieList()
        self.reservemovies = dataManager.getReserveMovieList()
        self.reserveDate = dataManager.getReserveDateList()
        self.movingMovie = dataManager.getMovingMovieList()
        
        
        //print(reserveDate)
        
        DispatchQueue.main.async {
            self.movieCollectionView.reloadData()
            self.mainCollectionView.reloadData()
        }
    }
    
    func getTitle(title: String) -> String? {
        return title
    }
    func getRating(rating: Double) -> Double? {
        return rating
    }
    func getDate(date: String) -> String? {
        return date
    }
    
    func getThumnailImage(withURL thumnailURL: String) -> UIImage? {
        guard let imageURL = URL(string: thumnailURL) else {
            return UIImage(named: "img_placeholder")
        }
        
        guard let imageData: Data = try? Data(contentsOf: imageURL) else {
            return UIImage(named: "img_placeholder")
        }
        
        return UIImage(data: imageData)
        
    }
    
    func getGradeImage(grade: Int) -> UIImage? {
        switch grade {
        case 0:
            return UIImage(named: "ic_allages")
        case 12:
            return UIImage(named: "ic_12")
        case 15:
            return UIImage(named: "ic_15")
        case 19:
            return UIImage(named: "ic_19")
        default:
            return nil
        }
    }
    
    //    func setDefaultMovieOrderType() {
    //        let orderType: String = "0"
    //        dataManager.setMovieOrderType(orderType: orderType)
    //    }
    
    func setMovieListCollectionView() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView?.isPagingEnabled = true
        
        //        if let layout = mainCollectionView?.collectionViewLayout as? AnimatedCollectionViewLayout {
        //            layout.animator = animator?.0
        //        }
        
    }
    
    
    
    
    
}

extension MainHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == movieCollectionView {
            
            return CGSize(width: 101, height: 146)
        }
            
        else if collectionView == mainCollectionView {
            
            //375 248
            
            return CGSize(width: 306, height: 202)
            
        }
        
        
        return CGSize(width: 101, height: 146)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == mainCollectionView {
            return UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 35)
        }
        return UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 19)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == mainCollectionView {
            return 70               }
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == mainCollectionView {
            
            return movieInfo.count
            
        }
        else if collectionView == movieCollectionView {
            
            //      print(dataManager.getMovingMovieList())
            
            if dataManager.getMovingMovieList() == nil{
                
                return reservemovies.count
                
            }
                
            else {
                return movingMovie.count
                
            }
        }
        return movieInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == mainCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainListID, for: indexPath) as! MainViewCollectionViewCell
            
            
            let movie = movieInfo[indexPath.row]
            
             //print(movie)
            
            cell.delegate = self
            
            cell.backgroundColor = .groundColor
            cell.makeRounded(cornerRadius: 10)
            
            cell.movieName.text = movie.title
            //  cell.runningtimeLabel.text = 얘는 API에 없음
            
            cell.rating.rating = Double((movie.userRating) / 2)
            cell.ratingLabel.text = String(describing: (movie.userRating) / 2)
            cell.currentIndex = indexPath.item
            
            
            OperationQueue().addOperation {
                let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                DispatchQueue.main.async {
                    cell.imageThumbnail.contentMode = .scaleAspectFill
                    cell.imageThumbnail.image = thumnailImage
                    
                }
            }
            return cell
            
        }
            
            
        else if collectionView == movieCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieCollectionViewCell
            
            //   movieInfo = self.dataManager.getMovieList()
            
            if dataManager.getMovingMovieList() == nil {
                
                let movie = movieInfo[indexPath.row]
                
                // print(movie)
                
                cell.backgroundColor = .groundColor
                cell.makeRounded(cornerRadius: 10)
                
                OperationQueue().addOperation {
                    let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                    DispatchQueue.main.async {
                        cell.ImageThumbnail.contentMode = .scaleAspectFill
                        cell.ImageThumbnail.image = thumnailImage
                        //                        cell.imageThumbnail.image = thumnailImage
                        
                    }
                }
                return cell
            }
                
            else
            {
                movingMovie = dataManager.getMovingMovieList()
                let movie = movingMovie[indexPath.row]
                
                cell.backgroundColor = .groundColor
                cell.makeRounded(cornerRadius: 10)
                
                
                
                
                OperationQueue().addOperation {
                    let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                    DispatchQueue.main.async {
                        cell.ImageThumbnail.contentMode = .scaleAspectFill
                        cell.ImageThumbnail.image = thumnailImage
                        //                        cell.imageThumbnail.image = thumnailImage
                        
                    }
                }
                return cell
            }
            
            
        }
        return UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //            let movie = movies[indexPath.row]
        //            let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
        //            self.selectedImage = thumnailImage
        //            dataManager.setImage(haveImage: self.selectedImage)
        //
        //            let movietitle = self.getTitle(title: movie.title)
        //            self.selectedTitle = movietitle
        //            dataManager.setTitle(haveTitle: self.selectedTitle)
        //
        //            let movieRating = self.getRating(rating: movie.userRating)
        //            self.selectedRating = movieRating
        //            dataManager.setRating(haveRating: self.selectedRating)
        //
        //            let movieDate = self.getDate(date: movie.date)
        //            self.selectedDate = movieDate
        //            dataManager.setDate(haveDate: self.selectedDate)
        
        
        //ImageManager.imageManager.setTitle(haveTitle: self.)
        // performSegue(withIdentifier: Storyboard.showDetailVC , sender: nil)
        
        
        
    }
    
}



extension MainHomeViewController: PlayLinkActionDelegate {
    
    //https://www.youtube.com/watch?v=28hYUZMufDg&list=RD28hYUZMufDg&start_radio=1
    func didClickedLink(index: Int) {
        
        guard let url = URL(string: "https://www.youtube.com/watch?v=KrM3vS5sy2w"), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
}




