import UIKit

//MARK: - HomeVCProtocol PR
protocol HomeVCProtocol : class {
    func Start_Loading()
    func End_Loading()
    func Reload_Collection()
    func HideView(Time : Double , newConstraint : CGFloat , hide : Bool)
    func ShowView(Time : Double , newConstraint : CGFloat , hide : Bool)
    func NewOffset(newOffset : CGPoint)
    func Open_More_VC(VC : OpenMoreVC)
    func Open_Detailed_Movie(VC : DetailedMoviesVC)
    func Open_Detailed_TV()
}

//MARK: - HomeCellProtocol PR
protocol HomeCellProtocol {
    func Set_Movies_Data(header : String , movies : Movies?)
    func Set_TV_Data(header : String , TVShows: TVShows?)
    func Selected_Cell(index : Int)
}

//MARK: - HomeHeaderProtocol PR
protocol HomeHeaderProtocol {
    func Set_Data(header : String)
}

//MARK: - HomeVCPresenter
class HomeVCPresenter {
    weak var view : HomeVCProtocol?
    var Popular_Movies : Movies?
    var Top_Movies : Movies?
    var Now_Playing_Movies : Movies?
    var UpComing_Movies : Movies?
    var PopularTV : TVShows?
    var NowPlayingTV : TVShows?
    var UpComingTV : TVShows?
    var TopTV : TVShows?
    let generic = GeneircAPIS()
    let mHeader = [MovieHeaders.Popular_Movies , MovieHeaders.Top_Movies ,MovieHeaders.Now_Playing_Movies , MovieHeaders.Up_Coming_Movies ]
    let tHeader = [TVHeaders.Popular_TV , TVHeaders.Top_TV , TVHeaders.Now_Playing_TV , TVHeaders.Up_Coming_TV]
    
    //MARK: - Class init
    init(view : HomeVCProtocol) {
        self.view = view
    }
    
    //MARK: - ViewDidLoad
    func ViewDidLoad() {
        Fetch_Movies_Data()
        Fetch_TVShows_Data()
    }
    
    //MARK: - Set HomeCell Data
    func Setup_HomeCell(cell : HomeCellProtocol , indexRow : Int , indexSection : Int) {
        let moviesArray = [Popular_Movies , Top_Movies , Now_Playing_Movies , UpComing_Movies]
        let tvArray = [PopularTV , TopTV , NowPlayingTV , UpComingTV]
        switch indexSection {
        case 0 :
            cell.Set_Movies_Data(header: mHeader[indexRow].movieHeader, movies: moviesArray[indexRow])
        case 1 :
            cell.Set_TV_Data(header: tHeader[indexRow].tvHeader, TVShows: tvArray[indexRow])
        default:
            return
        }
    }
    
    //MARK: -
    func Setup_HomeHeader(header : HomeHeaderProtocol , section : Int) {
        if section == 0 {
            header.Set_Data(header: "Movies")
        } else {
            header.Set_Data(header: "TV Shows")
        }
    }
    
    //MARK: - Select Cell Open Category Detail Button
    func Select_Open_Category(cell : HomeCellProtocol , index : Int) {
        cell.Selected_Cell(index: index)
    }
    
    //MARK: - Animate TopView
    func Animate_TopView(scrollView : UIScrollView , currentOffset : CGPoint , isHidden : Bool) {
        let newOffset = scrollView.contentOffset
        if newOffset.y > currentOffset.y {
            if isHidden == true {
                //Do Nothing
            } else {
                view?.HideView(Time: 0.4, newConstraint: -300, hide: true)
            }
        } else {
            if isHidden == true {
                view?.HideView(Time: 0.4, newConstraint: 0, hide: false)
            } else {
                //Do Nothing
            }
        }
    }
    
    //MARK: - Done Animating TopView
    func Done_Animating(newOffset : CGPoint) {
        if newOffset.y < 0 {
            view?.NewOffset(newOffset: CGPoint(x: 0.0, y: 0.0))
        } else {
            view?.NewOffset(newOffset: newOffset)
        }
    }
    
    //MARK: - Open More
    func OpenMore(section : Int , index : Int) {
        let AllMovies = [Popular_Movies , Top_Movies , Now_Playing_Movies , UpComing_Movies]
        let allTV = [PopularTV , TopTV , NowPlayingTV , UpComingTV]
        let destination = UIStoryboard(name: "MoveBase", bundle: nil).instantiateViewController(withIdentifier: "openMore") as! OpenMoreVC
        //Movies
        if section == 0 {
            destination.ismovie = true
            destination.movies = AllMovies[index]
            destination.modalPresentationStyle = .fullScreen
            destination.navTitle = mHeader[index].movieHeader
            destination.moreURL = mHeader[index].url
            view?.Open_More_VC(VC: destination)
        }
            //TVShows
        else {destination.ismovie = false
            destination.tvshows = allTV[index]
            destination.modalPresentationStyle = .fullScreen
            destination.navTitle = tHeader[index].tvHeader
            destination.moreURL = tHeader[index].url
            view?.Open_More_VC(VC: destination)
        }
    }
    
    //MARK: - Open Detailed VC
    func Open_Detailed(destination : DetailedMoviesVC) {
        self.view?.Open_Detailed_Movie(VC: destination)
    }
    
}
