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
    
    
    @IBOutlet weak var iCarouselView: iCarousel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var deadlineTitle: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
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
    
    let movieListCellID: String = "MovieListCell"
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iCarouselView.type = .rotary
        iCarouselView.contentMode = .scaleAspectFit
        iCarouselView.isPagingEnabled = true
        view.backgroundColor = .groundColor
        
        navigationSetup()
        setMovieListCollectionView()
        
        sendButton.backgroundColor = .mainOrange
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sendButton.makeRounded(cornerRadius: 21)
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
    
    @IBAction func reviseButton(_ sender: Any) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "MovieTabScreen", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MovieSelectionViewController") as! MovieSelectionViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func navigationSetup() { //네비게이션 투명색만들기
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 255/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "iconsDarkBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "iconsDarkBack")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "시간선택", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
        //투명하게 만드는 공식처럼 기억하기
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //네비게이션바의 백그라운드색 지정. UIImage와 동일
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //shadowImage는 UIImage와 동일. 구분선 없애줌.
        self.navigationController?.navigationBar.isTranslucent = true
        //false면 반투명이다.
        self.navigationController?.view.backgroundColor = UIColor.white.withAlphaComponent(0.0)
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
        print(1)
    }
    
    func setMovieListCollectionView() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    
    
}

extension MainHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 101, height: 146)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 19)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieCollectionViewCell
        
        let movie = movies[indexPath.row]
        
        cell.backgroundColor = .groundColor
        
        //cell.backgroundColor = .red
        
        //        cell.titleLabel.text = movie.title
        //        cell.dateLabel.text = movie.date
        //
        //        let rateString = "\(movie.reservationGrade)위 / \(movie.reservationRate)"
        //        cell.ratingsLabel.text = rateString
        //
        
        //  let gradeIamge = getGradeImage(grade: movie.grade)
        //  cell.gradeImage.image = gradeIamge
        
        
        OperationQueue().addOperation {
            let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
            DispatchQueue.main.async {
                cell.ImageThumbnail.image = thumnailImage
                
            }
        }
        
        return cell
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

extension MainHomeViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imageView: UIImageView!
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 300))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as? UIImageView
        }
        
        imageView.image = imgArr[index]
        imageView.makeRounded(cornerRadius: 10)
        return imageView
    }
    
    
}

