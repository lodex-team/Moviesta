import UIKit

class DetailedMoviesVC : BaseVC {
    
    //Outlets
    @IBOutlet var BGView: UIView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var MainViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var BGImage: UIImageView!
    @IBOutlet weak var IntroImage: UIImageView!
    @IBOutlet weak var CastCollection: UICollectionView!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var MovieNameLabel: UILabel!
    @IBOutlet weak var CrewCollection: UICollectionView!
    @IBOutlet weak var Rate_Label: UILabel!
    @IBOutlet weak var Language_Label: UILabel!
    @IBOutlet weak var Adult_Label: UILabel!
    @IBOutlet weak var Date_Label: UILabel!
    
    //Variables
    var presenter : DetailedMoviesVCPresenter!
    
    static func DetailedInit(with presenter : DetailedMoviesVCPresenter) -> DetailedMoviesVC {
        let vc = UIStoryboard(name: "Detailed", bundle: nil).instantiateViewController(withIdentifier: "DetailedMovies") as! DetailedMoviesVC
        vc.presenter = presenter
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Setup_Collection()
        presenter.Set_View(view: self)
        presenter.Setup_Page(introImage: IntroImage, decriptionLabel: DescriptionLabel ,nameLabel : MovieNameLabel , voteLabel: Rate_Label , languageLabel: Language_Label , adultLabel: Adult_Label , dateLabel: Date_Label)
    }
    

    private func Setup_Collection() {
        CastCollection.dataSource = self
        CastCollection.delegate = self
        CastCollection.register(UINib(nibName: "MovieCastCell", bundle: nil), forCellWithReuseIdentifier: "MovieCastCell")
        CrewCollection.dataSource = self
        CrewCollection.delegate = self
        CrewCollection.register(UINib(nibName: "MovieCastCell", bundle: nil), forCellWithReuseIdentifier: "MovieCastCell")
    }
}
