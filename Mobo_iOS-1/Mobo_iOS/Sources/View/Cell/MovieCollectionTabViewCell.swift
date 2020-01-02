






import UIKit


protocol MovieTabDelegate {
    
    func didMovieClicked(index: IndexPath)
    
}




class MovieCollectionTabViewCell: UICollectionViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var gradeImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var rating: FloatRatingView!
    @IBOutlet weak var imageSelect: UIImageView!
    
    
//    var myRatingView: FloatRatingView = {
//        let label = FloatRatingView()
//        label.frame = CGRect(x: 10, y: 0, width: 150, height: 30)
//        label.type = .halfRatings
//        label.emptyImage = UIImage(named: "ic_star_large")
//        label.fullImage = UIImage(named: "ic_star_large_full")
//        //label.backgroundColor = .red
//        label.contentMode = UIView.ContentMode.scaleAspectFit
//
//        return label
//    }()
//
//    var myRatingLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.frame = CGRect(x: 10, y: 40, width: 150, height: 20)
//        return label
//    }()
    
    var currentIndex: IndexPath?
    var delegate: MovieTabDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageThumbnail.makeRounded(cornerRadius: 10)
        self.rating.delegate = self

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapped(_:)))
        self.addGestureRecognizer(tap)
        imageSelect.isHidden = true
    }
    
    @objc func handleTapped(_ tap: UITapGestureRecognizer) {
        //이미지 뷰의 isHidden 속성을 바꿔주기
        imageSelect.isHidden.toggle()
        self.delegate?.didMovieClicked(index: currentIndex ?? IndexPath())
    }
}


extension MovieCollectionTabViewCell: FloatRatingViewDelegate {

    // MARK: FloatRatingViewDelegate

    func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
        ratingLabel.text = String(format: "%.2f", ratingView.rating)
    }

    func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
        ratingLabel.text = String(format: "%.2f", ratingView.rating)
    }

}
