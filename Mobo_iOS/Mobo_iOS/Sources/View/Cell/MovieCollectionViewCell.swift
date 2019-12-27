


import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var ImageThumbnail: UIImageView!
    @IBOutlet weak var gradeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageThumbnail.makeRounded(cornerRadius: 10)
    }
    
}


