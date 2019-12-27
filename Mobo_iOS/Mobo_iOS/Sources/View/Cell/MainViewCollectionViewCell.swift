






import UIKit
import AnimatedCollectionViewLayout

class MainViewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var GradeImage: UIImageView!
    var animator: (LayoutAttributesAnimator, Bool, Int, Int)?

    override func awakeFromNib() {
        super.awakeFromNib()
        imageThumbnail.makeRounded(cornerRadius: 10)
    }

}
