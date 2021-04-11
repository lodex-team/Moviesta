import UIKit

class HomeHeader: UICollectionReusableView , HomeHeaderProtocol {

    @IBOutlet weak var HomeHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func Set_Data(header: String) {
        HomeHeader.text = header
    }
    
}
