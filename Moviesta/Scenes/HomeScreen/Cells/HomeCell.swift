import UIKit
import Kingfisher

class HomeCell: UICollectionViewCell {
    
    //Outlets
    @IBOutlet weak var CellHeader: UILabel!
    @IBOutlet weak var MoviesCollection: UICollectionView!
    
    //Variables
    var closure : (() -> ())?
    var open_Detailed_Movie_Closure : ((_ destination : DetailedMoviesVC)->())?
    var numberOFSections : Int!
    var isMovie : Bool?
    var movies : Movies? {
        didSet {
            numberOFSections = self.movies?.results?.count ?? 0
            self.MoviesCollection.reloadData()
        }
    }
    
    var tvshows : TVShows? {
        didSet {
            numberOFSections = self.tvshows?.results?.count ?? 0
            self.MoviesCollection.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MoviesCollection.delegate = self
        MoviesCollection.dataSource = self
        MoviesCollection.register(UINib(nibName: "HomeSupCell", bundle: nil), forCellWithReuseIdentifier: "HomeSupCell")
    }
    
    //MARK: - Open Category Button
    @IBAction func OpenCategory(_ sender: Any) {
        closure?()
    }
}

//MARK: - HomeCell Protocol
extension HomeCell : HomeCellProtocol {
    func Set_Movies_Data(header : String , movies : Movies?) {
        self.CellHeader.text = header
        isMovie = true
        self.movies = movies
    }
    
    func Set_TV_Data(header: String, TVShows: TVShows?) {
        self.CellHeader.text = header
        isMovie = false
        self.tvshows = TVShows
    }
    
    func Selected_Cell(index: Int) {
        
    }
}


//MARK: - MoviesCollection Setup

extension HomeCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return numberOFSections
    }
    
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSupCell", for: indexPath) as! HomeSupCell
        
        //MARK: -  Movie Cell
        if isMovie == true {
            cell.MovieNameLabel.text = movies?.results![indexPath.row].title
            guard let posterPath = movies?.results![indexPath.row].posterPath
                else {
                    cell.SupImages.image = UIImage(named: "placeholder")
                    return cell
            }
            let imageURL = URLS.mainImages + posterPath
            let url = URL(string : imageURL)!
            cell.SupImages.kf.setImage(with: url , placeholder: UIImage(named: "placeholder"))
        }
        
            //MARK: -  TV Cell
        else {
            cell.MovieNameLabel.text = tvshows?.results![indexPath.row].name
            guard let posterPath = tvshows?.results![indexPath.row].posterPath
                else {
                    cell.SupImages.image = UIImage(named: "placeholder")
                    return cell
            }
            let imageURL = URLS.mainImages + posterPath
            let url = URL(string : imageURL)!
            cell.SupImages.kf.setImage(with: url , placeholder: UIImage(named: "placeholder"))
        }
        
        return cell
    }
    
    //MARK: - Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.MoviesCollection.frame.size.width / 3 , height: self.MoviesCollection.bounds.height - 20)
    }
    
    //MARK: - Cell Insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    //MARK: - Select Cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isMovie == true {
            let presenter = DetailedMoviesVCPresenter(movie: movies!.results![indexPath.row])
            let destination = DetailedMoviesVC.DetailedInit(with: presenter)
            open_Detailed_Movie_Closure?(destination)
        } else {
            
        }
    }
}
