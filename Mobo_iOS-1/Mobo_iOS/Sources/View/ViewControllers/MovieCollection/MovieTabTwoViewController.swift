//
//  MoviewTabOne.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class MovieTabTwoViewController: UIViewController {
    
    @IBOutlet weak var MovieCollectionView: UICollectionView!
    @IBOutlet weak var Title1: UILabel!
    @IBOutlet var Button1: UIButton!
    
    
    let movieListCellID: String = "MovieTabTwoViewCell"
    
    
    
    var movies: [movieInfo] = []
    var movieData: [TicketResponseString.TicketMovie.movieTicketInfo] = []
    var selectedImage: UIImage!
    var selectedTitle: String!
    var selectedRating: Double!
    var selectedDate: String!
    let dataManager = DataManager.sharedManager
        
    struct Storyboard {
        static let photoCell = "PhotoCell"
        static let showDetailVC = "ShowMovieDetail"
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
    }
    var isRevise = false
    var selectedIndex: [IndexPath] = []

    
    //init
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        MovieCollectionView.showsHorizontalScrollIndicator = false
        MovieCollectionView.decelerationRate = .fast
        //  MovieCollectionView.isScrollEnabled = false
        
        
        
        
        self.Title1.text = "    예매율TOP 10" // 띄어쓰기 4 번
        self.Title1.backgroundColor = .groundColor
        
        setMovieListCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if isRevise {
            Button1.setImage(UIImage(named: "btnTimeselect-1"), for: .normal)
        }
        else {
            Button1.setImage(UIImage(named: "btnTimeselect"), for: .normal)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        reloadMovieLists()
        //et orderType: String = dataManager.getMovieOrderType()
        //            getMovieList(orderType: orderType)
        getTicketingMoiveList() { (listResponse) in
            guard let response = listResponse else {
                return
            }
            
         //   print(response)
            
        }
        
    }
    
    
    func navigationSetup() { //네비게이션 투명색만들기
               
               //self.navigationController?.navigationBar.barTintColor = .mainOrange
            self.navigationController?.navigationBar.tintColor = .white
               self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "btnBack")
               self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btnBack")
               self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "시간 선택하기", style: .done, target: nil, action: nil)
    //           self.navigationItem.backBarButtonItem?.tintColor = .white
               //투명하게 만드는 공식처럼 기억하기
               self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               //네비게이션바의 백그라운드색 지정. UIImage와 동일
               self.navigationController?.navigationBar.shadowImage = UIImage()
               //shadowImage는 UIImage와 동일. 구분선 없애줌.
               self.navigationController?.navigationBar.isTranslucent = true
               //false면 반투명이다.
               
               //뷰의 배경색 지정
               
                       //self.navigationController?.navigationBar.topItem?.title = "
               //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 211/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)]
               //        navigationController?.navigationBar.titleTextAttributes = textAttributes
               
           }
    
    @IBAction func pickFinishBtn(_ sender: Any) {
        
        navigationSetup()
        let storyboard = UIStoryboard(name: "MovieTabScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TimeTableVC") as! MovieTimeTableViewController
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        self.show(vc, sender: nil)
        
        //self.present(vc, animated: true, completion: nil)   // 식별자 가르키는 곳으로 이동
        
    }
    
    
func getTicketingMoiveList(completion: @escaping (TicketResponseString?) -> Void) {
    
    let appUrl: String = "http://13.125.48.35:7935/movie/1"
    
    guard let finalURL = URL(string: appUrl) else {
        return
    }
    
    let session = URLSession(configuration: .default)
    var request = URLRequest(url: finalURL)
    
    request.addValue("application/x-www-form-urlencoded" , forHTTPHeaderField: "Content-Type")
    //    request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjM3LCJpYXQiOjE1Nzc1MzEyODUsImV4cCI6MTU3ODEzNjA4NSwiaXNzIjoibW9ib21hc3RlciJ9.T1oJedjdkHFdR-ZcN47P2S72nr6LuZ2l1ptJZJHHRAc", forHTTPHeaderField: "authorization")
    
    request.httpMethod = "GET"
    let task = session.dataTask(with: request) { (data, response, error) in
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let resultData = data else {
           // print(data)
            return
        }
        
        do {
            print("!!!!!!!!!!!")
            print(String(data: data!, encoding: .utf8))
            print("!!!!!!!!!!!")
            
            let movieTicketLists: TicketResponseString  = try JSONDecoder().decode(TicketResponseString.self, from: resultData)
            
            self.dataManager.setTicketingMoiveList(list: movieTicketLists.results.movieData)
       //     print(self.dataManager.setTicketingMoiveList(list: movieTicketLists.results.movieData))
            
            
          //  self.dataManager.setDidOrderTypeChangedAndDownloaded(true)
            self.reloadMovieLists()
            completion(movieTicketLists)
        }
        catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    task.resume()
}
    
    func reloadMovieLists() {
        
        self.movieData = dataManager.getTicketingMoiveList()
        
        //        self.movies = dataManager.getMovieList()[0].randMovie
        DispatchQueue.main.async {
            self.MovieCollectionView.reloadData()
            //        self.mainCollectionView.reloadData()
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
        MovieCollectionView.delegate = self
        MovieCollectionView.dataSource = self
        
        
        MovieCollectionView.backgroundColor = .groundColor
    }
    
    
    
}

extension MovieTabTwoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print(indexPath)
        
        if indexPath == [0, 0] || indexPath == [0, 1] {
            
            return CGSize(width: 140, height: 244)
            
        }
        
        return CGSize(width: 72, height: 150)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return min(movieData.count, 2)
        } else if section == 1{
            return min(max(movieData.count - 2, 0), 4)
        }
        else {
            return min(max(movieData.count - 6, 0), 4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 33, bottom: 25, right: 33)
        }
        return UIEdgeInsets(top: 5, left: 26, bottom: 0, right: 26)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if section == 0 {
            return 17
        }
        return 13
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieTabTwoViewCell

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieTabTwoViewCell
                     
                     
                     let movie = movieData[indexPath.row]
                     
                     cell.movieName.text = movie.title
                     cell.movieName.font = .boldSystemFont(ofSize: 12)
                    cell.movieName.adjustsFontSizeToFitWidth = true
                    cell.delegate = self
            cell.currentIndex = indexPath

                     
                     
                     //cell.dateLabel.text = movie.date
                     
                     
            cell.rating.rating = Double((movie.userRating) / 2)
                     cell.ratingLabel.text = String(describing: (movie.userRating) / 2)
                
//                     let gradeIamge = getGradeImage(grade: movie.grade)
//                     cell.gradeImage.image = gradeIamge
                     
                     OperationQueue().addOperation {
                         let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                         DispatchQueue.main.async {
                             cell.imageThumbnail.image = thumnailImage
                             
                         }
                     }
                     
                     return cell
            }
            
            
            else if indexPath.section == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieTabTwoViewCell
            
            
            let movie = movieData[indexPath.row + 2]
            
            cell.movieName.text = movie.title
            cell.movieName.font = .boldSystemFont(ofSize: 10)
            cell.movieName.adjustsFontSizeToFitWidth = true

            //cell.dateLabel.text = movie.date
            cell.delegate = self
            cell.currentIndex = indexPath

            
            cell.rating.rating = Double((movie.userRating) / 2)
            cell.ratingLabel.text = String(describing: (movie.userRating) / 2)
            
            
            
//            let gradeIamge = getGradeImage(grade: movie.grade)
//            cell.gradeImage.image = gradeIamge
            
            OperationQueue().addOperation {
                let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                DispatchQueue.main.async {
                    cell.imageThumbnail.image = thumnailImage
                    
                }
            }
            
            return cell
            
            }
            //        else if collectionView == movieCollectionTwoView {
            //
            //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListTwoCellID, for: indexPath) as! MovieTabTwoViewCell
            //
            //
            //            let movie = movies[indexPath.row]
            //
            //
            //            cell.backgroundColor = .clear
            //
            //            cell.movieName.text = movie.title
            //            // cell.dateLabel.text = movie.date
            //
            //
            //            cell.rating.rating = (movie.userRating) / 2
            //            cell.ratingLabel.text = String(describing: (movie.userRating) / 2) + " 점"
            //
            //
            //
            //            let gradeIamge = getGradeImage(grade: movie.grade)
            //            cell.gradeImage.image = gradeIamge
            //
            //            OperationQueue().addOperation {
            //                let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
            //                DispatchQueue.main.async {
            //                    cell.imageThumbnail.image = thumnailImage
            //
            //                }
            //            }
            //
            //            return cell
            //
            //        }
            
        else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieTabTwoViewCell
            
            
            let movie = movieData[indexPath.row + 6]
            
            cell.movieName.text = movie.title
            cell.movieName.font = .boldSystemFont(ofSize: 10)
            cell.movieName.adjustsFontSizeToFitWidth = true

            //cell.dateLabel.text = movie.date
            
            
            cell.rating.rating = Double((movie.userRating) / 2)
            cell.ratingLabel.text = String(describing: (movie.userRating) / 2)
            cell.delegate = self
            cell.currentIndex = indexPath

            
            
//            let gradeIamge = getGradeImage(grade: movie.grade)
//            cell.gradeImage.image = gradeIamge
            
            OperationQueue().addOperation {
                let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                DispatchQueue.main.async {
                    cell.imageThumbnail.image = thumnailImage
                    
                }
            }
            
            return cell
        }
            
            return UICollectionViewCell()
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        //        let movie = movies[indexPath.row]
        //        let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
        //        self.selectedImage = thumnailImage
        //        dataManager.setImage(haveImage: self.selectedImage)
        //
        //        let movietitle = self.getTitle(title: movie.title)
        //        self.selectedTitle = movietitle
        //        dataManager.setTitle(haveTitle: self.selectedTitle)
        //
        //        let movieRating = self.getRating(rating: movie.userRating)
        //        self.selectedRating = movieRating
        //        dataManager.setRating(haveRating: self.selectedRating)
        //
        //        let movieDate = self.getDate(date: movie.date)
        //        self.selectedDate = movieDate
        //        dataManager.setDate(haveDate: self.selectedDate)
        
        if collectionView == MovieCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieTabTwoViewCell
            
            
            let movie = movieData[indexPath.row]
            
            cell.imageThumbnail.isHighlighted = true
            
            //            //cell.backgroundColor = .red
            //
            //            cell.movieName.text = movie.title
            //            // cell.dateLabel.text = movie.date
            //
            //
            //            cell.rating.rating = (movie.userRating) / 2
            //            cell.ratingLabel.text = String(describing: (movie.userRating) / 2) + " 점"
            //
            //
            //
            //            let gradeIamge = getGradeImage(grade: movie.grade)
            //            cell.gradeImage.image = gradeIamge
            //
            //            OperationQueue().addOperation {
            //                let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
            //                DispatchQueue.main.async {
            //                    cell.imageThumbnail.image = thumnailImage
            //
            //                }
            //            }
            
            
        }
        
        
    }
    
}



extension MovieTabTwoViewController: MovieTabDelegate {
    func didMovieClicked(index: IndexPath) {
        if selectedIndex.contains(index) {
            for (i, v) in selectedIndex.enumerated() {
                if v == index {
                    selectedIndex.remove(at: i)
                }
            }
        } else {
            selectedIndex.append(index)
            selectedIndex.sort()
        }
        print(selectedIndex)
    }
}



