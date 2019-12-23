//
//  MoviewTabOne.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class MovieTabOneViewController: UIViewController {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet var button1: UIButton!
    
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
    
    //init
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.showsHorizontalScrollIndicator = false
        movieCollectionView.decelerationRate = .fast
        
        
        self.title1.text = "예매율TOP 10"
        self.button1.setTitle("다 골랐어~", for: .normal)
        self.button1.backgroundColor = .mainOragne
        self.button1.tintColor = .white
        
        
        setMovieListCollectionView()
       
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
    
        
    
    @IBAction func PickFinishBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "MovieTabScreen", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TimeTableVC") as! MovieTimeTableViewController
                vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
                self.show(vc, sender: nil)
        
                //self.present(vc, animated: true, completion: nil)   // 식별자 가르키는 곳으로 이동
        
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

extension MovieTabOneViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellID, for: indexPath) as! MovieCollectionViewCell
        
        
        let movie = movies[indexPath.row]
        
        
        //cell.backgroundColor = .red
        
        //        cell.titleLabel.text = movie.title
        //        cell.dateLabel.text = movie.date
        //
        //        let rateString = "\(movie.reservationGrade)위 / \(movie.reservationRate)"
        //        cell.ratingsLabel.text = rateString
        //
        //        let gradeIamge = getGradeImage(grade: movie.grade)
        //        cell.gradeImageView.image = gradeIamge
        
        let gradeIamge = getGradeImage(grade: movie.grade)
        cell.gradeImage.image = gradeIamge
        
        OperationQueue().addOperation {
            let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
            DispatchQueue.main.async {
                cell.ImageThumbnail.image = thumnailImage
                
            }
        }
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
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
//
//
//        //ImageManager.imageManager.setTitle(haveTitle: self.)
//        // performSegue(withIdentifier: Storyboard.showDetailVC , sender: nil)
//
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "HomeScreen", bundle: nil)
//
//        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailViewController
//
//        self.navigationController?.pushViewController(vc, animated: true)
//
//
//    }
    
}
