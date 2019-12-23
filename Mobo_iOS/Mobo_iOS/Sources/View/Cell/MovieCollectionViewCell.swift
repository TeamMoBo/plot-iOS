import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var ImageThumbnail: UIImageView!
    @IBOutlet weak var gradeImage: UIImageView!
    

//    var MovieImage: UIImageView = {
//        let MovieImage = UIImageView()
//        MovieImage.image = #imageLiteral(resourceName: "img_placeholder").withRenderingMode(.alwaysOriginal)
//        return MovieImage
//    }()
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.addSubview(MovieImage)
//        self.backgroundColor = .white
//    }
//
    override func prepareForReuse() {
        
    }
}
