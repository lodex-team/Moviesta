import UIKit

class OpenMoreVC: BaseVC {
    
    //Outlets
    
    //Variables
    var presenter : OpenMoreMoviesVCPresenter?
    var movies : Movies?
    var tvshows : TVShows?
    var ismovie : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OpenMoreMoviesVCPresenter(view: self, Movies: movies, TV: tvshows, ismovie: ismovie)
    }
    
}
