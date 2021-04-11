import UIKit

extension HomeVCPresenter {
    
    func Fetch_Movies_Data() {
        
        view?.Start_Loading()
        
        //MARK: -  Get Popular Movies
        generic.Generic_Request(page: 1, url: URLS.popularMovies) { [weak self] (error, result : Movies?) in
            guard let self = self else { return }
            self.view?.End_Loading()
            if error != nil {
                print("Error 99092")
            } else {
                self.Popular_Movies = result
                self.view?.Reload_Collection()
            }
        }
        
        //MARK: -  Get Top Movies
        generic.Generic_Request(page: 1, url: URLS.topMovies) { [weak self] (error, result : Movies?) in
            guard let self = self else { return }
            if error != nil {
                print("Error 66554")
            } else {
                self.Top_Movies = result
                self.view?.Reload_Collection()
            }
        }
        
        //MARK: -  Get Now Playing
        generic.Generic_Request(page: 1, url: URLS.nowPlayingMovies) {[weak self] (error, result : Movies?) in
            guard let self = self else { return }
            if error != nil {
                print("Error 44354")
            } else {
                self.Now_Playing_Movies = result
                self.view?.Reload_Collection()
            }
        }
        
        //MARK: - Get UpComing Movies
        generic.Generic_Request(page: 1, url: URLS.upComingMovies) { (error, result : Movies?) in
            if error != nil {
                print("Error 112343")
            } else {
                self.UpComing_Movies = result
                self.view?.Reload_Collection()
            }
        }
        
    }
}
