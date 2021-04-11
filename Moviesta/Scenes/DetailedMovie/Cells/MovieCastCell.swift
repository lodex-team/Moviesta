import UIKit

class MovieCastCell: UICollectionViewCell , DetailedMoviesCellProtocol {

    @IBOutlet weak var CastImage: UIImageView!
    @IBOutlet weak var CastName: UILabel!
    @IBOutlet weak var CastCharc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CastImage.layer.cornerRadius = 12
    }

    //MARK: - Detailed Movies Protocol -- For Cast --
    func Set_Data(imageURL: URL?, name: String , charc : String) {
        CastName.text = name
        CastCharc.text = charc
        if imageURL != nil {
            CastImage.kf.setImage(with: imageURL!)
        } else { CastImage.image = #imageLiteral(resourceName: "placeholder") }
    }
    
}
