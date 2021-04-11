import UIKit

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource ,
UICollectionViewDelegateFlowLayout , UIScrollViewDelegate {
    
    //MARK: - Number OF Items In Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //MARK: - Number OF Sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        presenter.Setup_HomeCell(cell: cell, indexRow: indexPath.row , indexSection: indexPath.section)
        cell.closure = {
            self.presenter.OpenMore(section: indexPath.section, index: indexPath.row)
        }
        cell.open_Detailed_Movie_Closure = { (destination) in
            self.presenter.Open_Detailed(destination: destination)
        }
        return cell
    }
    
    //MARK: - Cell Style
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.MainCollection.frame.size.width - 16
        let height = CGFloat(280)
        return CGSize(width: width, height: height)
    }
    
    //MARK: - Cell Insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    //MARK: - Collection View Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeader", for: indexPath) as! HomeHeader
        presenter.Setup_HomeHeader(header: header, section: indexPath.section)
        
        return header
    }
    
    //MARK: - Header Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = self.MainCollection.frame.size.width
        if section == 0 {
            let height = CGFloat(116)
            return CGSize(width: width, height: height)
        } else {
            let height = CGFloat(48)
            return CGSize(width: width, height: height)
        }
    }
    
    //MARK: - Scrolling Animation
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.Animate_TopView(scrollView: MainCollection, currentOffset: currentOffset, isHidden: isHidden)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        presenter.Done_Animating(newOffset: MainCollection.contentOffset)
    }
    
}
