






import UIKit


protocol PlayLinkActionDelegate {
    
    func didClickedLink(index: Int)
    
}



class MainViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var LinkBtn: UIButton!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var rating: FloatRatingView!
    @IBOutlet weak var tagBtn: UIButton!
    @IBOutlet weak var runningtimeLabel: UILabel!
    
    @IBOutlet weak var tag2Btn: UIButton!
    @IBOutlet weak var tag3Btn: UIButton!
    
    var currentIndex: Int?
    var delegate : PlayLinkActionDelegate?

    let caLayer: CAGradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createGradient()
    
        
    }
    
    @IBAction func didClick(_ sender: Any) {
        self.delegate?.didClickedLink(index: currentIndex ?? 0)
    }
    
    
    func createGradient() {
       // print(111)
        caLayer.startPoint = CGPoint(x: 0.5, y: 0)
        caLayer.endPoint = CGPoint(x: 0.5, y: 1)
        caLayer.locations = [0,1]
        caLayer.frame = imageThumbnail.frame
        caLayer.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        imageThumbnail.layer.addSublayer(caLayer)
    }
    
}
