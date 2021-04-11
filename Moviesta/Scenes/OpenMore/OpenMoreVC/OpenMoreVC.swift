import UIKit

class OpenMoreVC: BaseVC {
    
    //Outlets
    @IBOutlet weak var MoreCollectionView: UICollectionView!
    
    //Variables
    var presenter : OpenMoreVCPresenter!
    var movies : Movies?
    var tvshows : TVShows?
    var ismovie : Bool = false
    var navTitle : String!
    var moreURL : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        Set_Collection()
        presenter = OpenMoreVCPresenter(view: self, Movies: movies, TV: tvshows, ismovie: ismovie)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = navTitle
    }
    
    private func Set_Collection() {
        MoreCollectionView.delegate = self
        MoreCollectionView.dataSource = self
        MoreCollectionView.register(UINib(nibName: "MoreCell", bundle: nil), forCellWithReuseIdentifier: "MoreCell")
    }
    
}
