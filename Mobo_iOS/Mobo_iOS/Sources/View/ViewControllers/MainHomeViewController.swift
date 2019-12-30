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
    
    
    // @IBOutlet weak var iCarouselView: iCarousel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var deadlineTitle: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var dayButton: UIButton!
    @IBOutlet weak var day2Button: UIButton!
    @IBOutlet weak var bottomview: UIView!
    
    
    
    var imgArr = [  UIImage(named:"10"),
                    UIImage(named:"10")
        //                       UIImage(named:"Ane Hathaway") ,
        //                       UIImage(named:"Dakota Johnson") ,
        //                       UIImage(named:"Emma Stone") ,
        //                       UIImage(named:"Emma Watson") ,
        //                       UIImage(named:"Halle Berry") ,
        //                       UIImage(named:"Jennifer Lawrence") ,
        //                       UIImage(named:"Jessica Alba") ,
        //                       UIImage(named:"Scarlett Johansson")
    ]
    
    
    //    private let animators: [(LayoutAttributesAnimator, Bool, Int, Int)] = [
    //        (ZoomInOutAttributesAnimator(), true, 1, 1)
    //    ]
    
    
    let movieListCellID: String = "MovieListCell"
    let mainListID: String = "mainCollectionViewCell"
    var movies: [Movie] = []
    var selectedImage: UIImage!
    var selectedTitle: String!
    var selectedRating: Double!
    var selectedDate: String!
    let dataManager = DataManager.sharedManager
    
    let baseURL: String = {
        return ServerURLs.base.rawValue
    }()
    
    
    struct Storyboard {
        static let photoCell = "PhotoCell"
        static let showDetailVC = "ShowMovieDetail"
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
    }
    
    let caLayer: CAGradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .groundColor
        setMovieListCollectionView()
        
        dayButton.makeRounded(cornerRadius: 10)
        dayButton.tintColor = .black
        dayButton.isSelected = false
        navigationSetup()
        
        mainCollectionView.backgroundColor = .red
        mainCollectionView.backgroundColor = .clear
        movieCollectionView.backgroundColor = .clear
        
        
        bottomview.makeRounded(cornerRadius: 10)
        bottomview.dropShadow(color: .lightGray, offSet: CGSize(width: 1, height: 1), opacity: 0.7, radius: 5)
        // dayButton.addTarget(self, action: #selector(dayClick), for: .touchUpInside)
        
        
        
    }
    
    @IBAction func tmp(_ sender: Any) {
        

        let storyboard = UIStoryboard(name: "PopUpScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InventoryPopUpViewController") as! InventoryPopUpViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: true, completion: nil)
    
        
    }
    
    @IBAction func buyBtn(_ sender: Any) {
        
        navigationSetup2()

        //        let view = LatePopUp(frame: CGRect(x: 0, y: 150, width: 375, height: 0))
        //        self.view.addSubview(view)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "TimeTableVC") as! MovieTimeTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func dayClick(sender: UIButton) {
        
        print(dayButton.isSelected)
        
        if (dayButton.isSelected) == false {
            dayButton.tintColor = .black
            dayButton.isSelected = true
            dayButton.backgroundColor = UIColor.init(red: 255/255, green: 126/255, blue: 39/255, alpha: 1)
            
            
        }
            
        else if dayButton.isSelected
        {
            dayButton.tintColor = .white
            dayButton.isSelected = false
            dayButton.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //sendButton.makeRounded(cornerRadius: 20)
        deadlineTitle.textColor = .subOrange
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        if dataManager.getDidOrderTypeChangedAndDownloaded() {
            reloadMovieLists()
        }
        else {reloadMovieLists()
            let orderType: String = dataManager.getMovieOrderType()
            getMovieList(orderType: orderType)
        }
    }
    
    
    
    
    
    @IBAction func myPageBtn(_ sender: Any) {
        
//        navigationSetup0()

        let mainStoryboard: UIStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MyPageVC") as! MyPageViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "마이 페이지", style: .done, target: nil, action: nil)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func reviseButton(_ sender: Any) {
        
        navigationSetup1()

        let mainStoryboard: UIStoryboard = UIStoryboard(name: "MovieTabScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MovieSelectionViewController") as! MovieSelectionViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func addMoreBtn(_ sender: Any) {
        
        navigationSetup1()

               let mainStoryboard: UIStoryboard = UIStoryboard(name: "MovieTabScreen", bundle: nil)
               let vc = mainStoryboard.instantiateViewController(withIdentifier: "MovieMoreTableViewController") as! MovieMoreTableViewController
               
               self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func chatBtn(_ sender: Any) {
        
        navigationSetup3()
        
       let storyboard = UIStoryboard(name: "ChattingScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatLoginVC") as! ChattingLoginViewController
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        self.show(vc, sender: nil)
        
    }
    
    func navigationSetup() { //네비게이션 투명색만들기
           
           self.navigationController?.navigationBar.barTintColor = .mainOrange
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
           
           //        self.navigationController?.navigationBar.topItem?.title = "Home"
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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "어떤 영화 볼래?", style: .done, target: nil, action: nil)
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
        
        self.navigationController?.navigationBar.barTintColor = .mainOrange
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "시간 선택 수정", style: .done, target: nil, action: nil)
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
    
    func navigationSetup3() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = .mainOrange
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "채팅방 이애오", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
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

    
    
    func getMovieList(orderType: String) {
        
        let url: String = baseURL + ServerURLs.movieList.rawValue + orderType
        
        guard let finalURL = URL(string: url) else {
            return
        }
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: finalURL)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let resultData = data else {
                return
            }
            
            do {
                print("Success")
                let movieLists: ListResponse  = try JSONDecoder().decode(ListResponse.self, from: resultData)
                
                self.dataManager.setMovieList(list: movieLists.results)
                self.dataManager.setDidOrderTypeChangedAndDownloaded(true)
                self.reloadMovieLists()
            }
            catch let error {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
    
    func reloadMovieLists() {
        self.movies = dataManager.getMovieList()
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
    
    func setDefaultMovieOrderType() {
        let orderType: String = "0"
        dataManager.setMovieOrderType(orderType: orderType)
    }
    
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
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == movieCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieCollectionViewCell
            
            let movie = movies[indexPath.item]
            
            
            OperationQueue().addOperation {
                let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                DispatchQueue.main.async {
                    cell.ImageThumbnail.image = thumnailImage
                    //cell.imageThumbnail.image = thumnailImage
                    
                }
            }
            
            
            return cell
        }
            
            
        else if collectionView == mainCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainListID, for: indexPath) as! MainViewCollectionViewCell
            
            let movie = movies[indexPath.row]
            
            
            cell.delegate = self
            
            cell.backgroundColor = .groundColor
            cell.makeRounded(cornerRadius: 10)
            
            cell.movieName.text = movie.title
            //  cell.runningtimeLabel.text = 얘는 API에 없음
            
            cell.rating.rating = (movie.userRating) / 2
            cell.ratingLabel.text = String(describing: (movie.userRating) / 2)
            cell.currentIndex = indexPath.item
            //cell.LinkBtn
            
            
            OperationQueue().addOperation {
                let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                DispatchQueue.main.async {
                    // cell.ImageThumbnail.image = thumnailImage
                    cell.imageThumbnail.image = thumnailImage
                    
                }
            }
            return cell
            
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
        
        guard let url = URL(string: "https://www.youtube.com/watch?v=28hYUZMufDg&list=RD28hYUZMufDg&start_radio=1"), UIApplication.shared.canOpenURL(url) else { return }
         UIApplication.shared.open(url, options: [:], completionHandler: nil)

    }
    
}




