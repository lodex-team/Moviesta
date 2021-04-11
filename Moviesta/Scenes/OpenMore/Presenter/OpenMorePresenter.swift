import UIKit

//MARK: - VC Protocol
protocol OpenMoreVCProtocol : class {
    func Start_Loading()
    func End_Loading()
    func Reload_Collection()
    func View_Detiled_Movie(movie : DetailedMoviesVC)
}

//MARK: - Cell Protocol
protocol OpenMoreCellProtocol {
    func Set_Data(image : String , Name : String)
}

//MARK: - VC Presenter
class OpenMoreVCPresenter {
    weak var view : OpenMoreVCProtocol?
    var movies : Movies?
    var tvshows : TVShows?
    var isMovie : Bool
    var isLoading = false
    var page = 1
    let generics = GeneircAPIS()
    var cellAnimationOver = false
    
    init(view : OpenMoreVCProtocol , Movies : Movies? , TV : TVShows? , ismovie : Bool) {
        self.view = view
        self.movies = Movies
        self.tvshows = TV
        self.isMovie = ismovie
        view.Reload_Collection()
    }
    
    
    //MARK: - Cell Setup
    func Setup_Cell(cell : OpenMoreCellProtocol , index : Int) {
        if isMovie == true {
            let image = movies!.results![index].posterPath ?? " "
            guard let name = movies!.results![index].title else { print("222") ; return }
            cell.Set_Data(image: image, Name: name)
        } else {
            let image = tvshows!.results![index].posterPath ?? " "
            guard let name = tvshows!.results![index].name else { print("111") ; return }
            cell.Set_Data(image: image, Name: name)
        }
    }
    
    //MARK: - Cell Count
    func Cells_Count() -> Int {
        if isMovie == true {
            return movies!.results!.count
        } else {
            return tvshows!.results!.count
        }
    }
    
    //MARK: - Scroll To Load
    func Scroll_TO_Load(scrollView : UIScrollView , url : String) {
        if scrollView.contentOffset.y == scrollView.contentSize.height - scrollView.frame.size.height {
            Load_More_Data(url: url)
        }
    }
    
    
    //MARK: - Load More Data
    func Load_More_Data(url : String) {
        switch isMovie {
        // IF Movies Page
        case true :
            if isLoading == false {
                isLoading = true
                page += 1
                generics.Generic_Request(page: page, url: url) {[weak self] (error, result : Movies?) in
                    guard let self = self else { return }
                    if error != nil {
                        print("345621")
                        self.isLoading = false
                    } else {
                        guard let newMovies = result?.results
                            else { print("908S")
                                ; return
                        }
                        self.movies?.page = self.page
                        self.movies?.results?.append(contentsOf: newMovies)
                        self.view?.Reload_Collection()
                        self.isLoading = false
                    }
                }
            }
            //IF TV Page
        case false :
            if isLoading == false {
                isLoading = true
                page += 1
                generics.Generic_Request(page: page, url: url) {[weak self] (error, result : TVShows?) in
                    guard let self = self else { return }
                    if error != nil {
                        print("432156")
                        self.isLoading = false
                    } else {
                        guard let newTV = result?.results else {print("908S") ; return }
                        self.tvshows?.page = self.page
                        self.tvshows?.results?.append(contentsOf: newTV)
                        self.view?.Reload_Collection()
                        self.isLoading = false
                    }
                }
            }
        }
    }
    
    //MARK: - Did Select Item
    func Did_Select_Cell(index : Int) {
        switch isMovie {
            //Movie
        case true :
            let detailedMPresenter = DetailedMoviesVCPresenter(movie: movies!.results![index])
            let destination = DetailedMoviesVC.DetailedInit(with: detailedMPresenter)
            self.view?.View_Detiled_Movie(movie: destination)
            //TV
        case false :
            print(tvshows!.results![index].id!)
        }
    }
    
    //MARK: - Animate Cell
    func Animate_Cell(cell : UICollectionViewCell) {
        if cellAnimationOver == false {
            
            cell.transform = CGAffineTransform(translationX: 0 , y: 1000)
            UIView.animate(withDuration: 1.0, animations: {
                cell.transform = .identity
            }) {[weak self] (done) in
                guard let self = self else { return }
                self.cellAnimationOver = true
            }
            
        }
        
    }
    
}
