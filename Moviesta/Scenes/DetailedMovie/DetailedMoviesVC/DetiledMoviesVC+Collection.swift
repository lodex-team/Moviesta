import UIKit

extension DetailedMoviesVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == CastCollection {
            return presenter.Get_Cast_Collection_Count()
        } else {
            return presenter.Get_Crew_Collection_Count()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCastCell", for: indexPath) as! MovieCastCell
        if collectionView == CastCollection {
            presenter.Setup_Cast_Cell(cell: cell, index: indexPath.row)
            return cell
        } else {
            presenter.Setup_Crew_Cell(cell: cell, index: indexPath.row)
            return cell
        }
    }
    
    //MARK: - Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.CastCollection.frame.size.width - 16) / 3
        let height = self.CastCollection.frame.size.height - 16
        
        return CGSize(width: width, height: height)
    }
    
    //MARK: - Cells Insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}
