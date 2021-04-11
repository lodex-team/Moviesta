import UIKit
import SwiftSpinner

extension OpenMoreVC : OpenMoreVCProtocol {
    
    func Start_Loading() {
        SwiftSpinner.show("Loading")
    }
    
    func End_Loading() {
        SwiftSpinner.hide()
    }
    
    func Reload_Collection() {
        MoreCollectionView.reloadData()
    }
    
    func View_Detiled_Movie(movie: DetailedMoviesVC) {
        self.navigationController?.pushViewController(movie, animated: true)
    }
}
