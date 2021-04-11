import UIKit

extension HomeVCPresenter {
    
    func Fetch_TVShows_Data() {
        
        //MARK: -  Get Popular TV
        self.view?.Start_Loading()
        generic.Generic_Request(page: 1, url: URLS.popularTV) {[weak self] (error, result : TVShows?) in
            if error != nil {
                self?.view?.End_Loading()
                print("Error 34343")
            } else {
                self?.PopularTV = result
                self?.view?.Reload_Collection()
            }
        }
        
        //MARK: - Get Top TV
        generic.Generic_Request(page: 1, url:URLS.topTV) { (error, result : TVShows?) in
            if error != nil {
                print("Error 89789")
            } else {
                self.TopTV = result
                self.view?.Reload_Collection()
            }
        }
        
        //MARK: - Now Playing TV
        generic.Generic_Request(page: 1, url:URLS.nowPlayingTV) { (error, result : TVShows?) in
            if error != nil {
                print("Error 18028")
            } else {
                self.NowPlayingTV = result
                self.view?.Reload_Collection()
            }
        }
        
        //MARK: - UpComing TV
        generic.Generic_Request(page: 1, url:URLS.upComingTV) { (error, result : TVShows?) in
            if error != nil {
                print("Error 45892")
            } else {
                self.UpComingTV = result
                self.view?.Reload_Collection()
            }
        }
        
    }
    
    
}
