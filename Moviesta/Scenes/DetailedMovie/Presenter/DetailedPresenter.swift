import UIKit
import Kingfisher

//MARK: - Detailed Movies VC Protocol
protocol DetailedMoviesVCProtocol : class {
    func LayOutIFNeeded()
    func Reload_Collection()
    func Start_Loading()
    func End_Loading()
    func Should_Animate()
}

//MARK: - Cell Protocol
protocol DetailedMoviesCellProtocol {
    func Set_Data(imageURL : URL? , name : String , charc : String)
}

//MARK: - Detailed Movies VC Presenter Class
class DetailedMoviesVCPresenter {
    weak var view : DetailedMoviesVCProtocol?
    var movie : Result?
    let generics = GeneircAPIS()
    var movieCredits : MovieCredits?
    
    //MARK: - INIT
    init(movie : Result) {
        self.movie = movie
    }
    
    //MARK: - Set View
    func Set_View(view : DetailedMoviesVCProtocol) {
        self.view = view
    }
    
    //MARK: - Get The Page Ready
    func Setup_Page(introImage : UIImageView , decriptionLabel : UILabel , nameLabel : UILabel , voteLabel : UILabel , languageLabel : UILabel , adultLabel : UILabel , dateLabel : UILabel) {
        
        //Get Movie Credits URL
        let url = URLS.movieCredits + String(movie!.id!) + "/credits"
        self.view?.Start_Loading()
        generics.Generic_Credits(url: url) {[weak self] (error, result : MovieCredits?) in
            self?.view?.End_Loading()
            guard let self = self else { return }
            if error != nil {
                print("Error 090889")
            } else {
                self.movieCredits = result
                self.view?.Reload_Collection()
                self.view?.Should_Animate()
            }
        }
        
        //Movie Image
        if movie?.posterPath != nil {
            let imgeURL = URLS.mainImages + movie!.posterPath!
            let url = URL(string: imgeURL)!
            introImage.kf.setImage(with: url)
        }
        
        //Movie Description
        decriptionLabel.text = movie?.overview ?? " "
        
        //Movie Name
        nameLabel.text = movie?.originalTitle
        
        //Labels
        let averageVote = movie?.voteAverage ?? 0.0
        voteLabel.text = "\(averageVote)"
        languageLabel.text = movie?.originalLanguage ?? " "
        var adult = "No"
        movie!.adult! == true ? (adult = "Yes") : (adult = "No")
        adultLabel.text = adult
        dateLabel.text = movie?.releaseDate ?? " "
    }
    
    //MARK: - Cast Collection Cell Count
    func Get_Cast_Collection_Count() -> Int {
        let count = movieCredits?.cast?.count ?? 0
        return count
    }
    
    //MARK: - Crew Collection Cell Count
    func Get_Crew_Collection_Count() -> Int {
        let count = movieCredits?.crew?.count ?? 0
        return count
    }
    
    //MARK: - Setup Cell Cast
    func Setup_Cast_Cell(cell : DetailedMoviesCellProtocol , index : Int) {
        var name = " "
        var charcName = " "
        if movieCredits!.cast![index].name != nil {
            name = movieCredits!.cast![index].name!
        }
        
        if movieCredits!.cast![index].character != nil {
            charcName = movieCredits!.cast![index].character!
        }
        
        if movieCredits?.cast![index].profilePath != nil {
            let imageURL = URLS.mainImages + movieCredits!.cast![index].profilePath!
            let url = URL(string: imageURL)!
            cell.Set_Data(imageURL: url, name: name , charc: charcName)
        } else {
            cell.Set_Data(imageURL: nil, name: name , charc: charcName)
        }
        
    }
    
    //MARK: - Setup Cell Crew
    func Setup_Crew_Cell(cell : DetailedMoviesCellProtocol , index : Int) {
        var name = " "
        var job = " "
        if movieCredits!.crew![index].name != nil {
            name = movieCredits!.crew![index].name!
        }
        
        if movieCredits!.crew![index].job != nil {
            job = movieCredits!.crew![index].job!
        }
        
        if movieCredits?.crew![index].profilePath != nil {
            let imageURL = URLS.mainImages + movieCredits!.crew![index].profilePath!
            let url = URL(string: imageURL)!
            cell.Set_Data(imageURL: url, name: name , charc: job)
        } else {
            cell.Set_Data(imageURL: nil, name: name , charc: job)
        }
        
    }
    
    //MARK: - Animating View Entrance
    func Animate_View(constant : NSLayoutConstraint , view : UIView , bgImage : UIImageView  , bgView : UIView) {

        if movie?.backdropPath != nil {
            let bgURL = movie!.backdropPath!
            let urlImage = URLS.mainImages + bgURL
            let url = URL(string : urlImage)!
            bgImage.kf.setImage(with: url)
        }
        
        //Go Right Animation
        UIView.animate(withDuration: 0.7, delay: 0.7 , animations: {
            constant.constant = 0
            self.view?.LayOutIFNeeded()
        }, completion: { (done) in
            bgView.backgroundColor = .white
        })
    }
    
}
