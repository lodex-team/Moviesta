import UIKit

class HomeVC : BaseVC {
    
    //Outlets
    @IBOutlet weak var MainCollection: UICollectionView!
    
    //Variables
    var presenter : HomeVCPresenter!
    var currentOffset = CGPoint(x: 0.0, y: 0.0)
    var isHidden = false
    @IBOutlet weak var TopViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Setup_MainCollection()
        presenter = HomeVCPresenter(view: self)
        DispatchQueueHelper.HelperDispatchQueue {
            self.presenter.ViewDidLoad()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    //MARK: - Setup_Collection
    private func Setup_MainCollection() {
        MainCollection.delegate = self
        MainCollection.dataSource = self
        MainCollection.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        MainCollection.register(UINib(nibName: "HomeHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader")
    }
    
    //MARK: - Search Button
    @IBAction func SearchButton(_ sender: Any) {
        print("Serach")
    }
    
    //MARK: - Options Button
    @IBAction func OptionsButton(_ sender: Any) {
        print("Options")
    }
    
}

