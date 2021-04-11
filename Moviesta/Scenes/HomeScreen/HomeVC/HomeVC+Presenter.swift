import UIKit
import SwiftSpinner

extension HomeVC : HomeVCProtocol {
    
    func Start_Loading() {
        SwiftSpinner.show("Loading")
    }
    
    func End_Loading() {
        SwiftSpinner.hide()
    }
    
    func Reload_Collection() {
        MainCollection.reloadData()
    }
    
    func HideView(Time: Double , newConstraint : CGFloat , hide : Bool) {
        UIView.animate(withDuration: Time, animations: {
            self.TopViewConstraint.constant = newConstraint
            self.view.layoutIfNeeded()
        }) { (done) in
            self.isHidden = hide
        }
    }
    
    func ShowView(Time: Double , newConstraint : CGFloat , hide : Bool) {
        UIView.animate(withDuration: Time, animations: {
            self.TopViewConstraint.constant = newConstraint
            self.view.layoutIfNeeded()
        }) { (done) in
            self.isHidden = hide
        }
    }
    
    func NewOffset(newOffset: CGPoint) {
        self.currentOffset = newOffset
    }
    
    func Open_More_VC(VC: OpenMoreVC) {
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func Open_Detailed_Movie(VC: DetailedMoviesVC) {
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func Open_Detailed_TV() {
        
    }
    
}
