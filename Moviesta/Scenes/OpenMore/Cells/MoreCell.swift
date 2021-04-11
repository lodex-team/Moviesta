import UIKit
import Kingfisher

class MoreCell: UICollectionViewCell , OpenMoreCellProtocol {

    //Outlets
    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var ItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    //MARK: - Cell Protocol
    func Set_Data(image: String, Name: String) {
        
        ItemImage.layer.cornerRadius = 12
        ItemImage.layer.masksToBounds = true
        
        ItemName.text = Name
        if image != " "  {
            let imageURL = URLS.mainImages + image
            let url = URL(string : imageURL)!
            ItemImage.kf.setImage(with: url , placeholder: UIImage(named: "placeholder"))
        } else {
            ItemImage.image = UIImage(named: "placeholder")
        }
    }
}
