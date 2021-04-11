import UIKit
import Kingfisher
import SwiftSpinner

extension DetailedMoviesVC : DetailedMoviesVCProtocol {
    
    func LayOutIFNeeded() {
        self.view.layoutIfNeeded()
    }
    
    func Start_Loading() {
        SwiftSpinner.show("Loading")
    }
    
    func End_Loading() {
        SwiftSpinner.hide()
    }
    
    func Reload_Collection() {
        CastCollection.reloadData()
        CrewCollection.reloadData()
    }
    
    func Should_Animate() {
        presenter.Animate_View(constant: MainViewLeftConstraint, view: MainView , bgImage: BGImage , bgView: BGView)
    }
}
