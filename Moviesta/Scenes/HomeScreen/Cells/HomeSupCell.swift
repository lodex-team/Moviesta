import UIKit
import Kingfisher

class HomeSupCell: UICollectionViewCell {
    
    //Outlets
    @IBOutlet weak var SupImages: UIImageView!
    @IBOutlet weak var MovieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SupImages.layer.cornerRadius = 12
        SupImages.layer.masksToBounds = true
    }

}
