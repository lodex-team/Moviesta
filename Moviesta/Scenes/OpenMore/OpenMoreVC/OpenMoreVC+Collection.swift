import UIKit

extension OpenMoreVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , UIScrollViewDelegate {
    
    //MARK: - Number OF Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.Cells_Count()
    }
    
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCell", for: indexPath) as! MoreCell
        presenter.Setup_Cell(cell: cell, index: indexPath.row)
        presenter.Animate_Cell(cell: cell)
        
        return cell
    }
    
    //MARK: - Insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
    
    //MARK: - Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.MoreCollectionView.frame.size.width - 44) / 2
        let height = CGFloat(280)
        return CGSize(width: width, height: height)
    }
    
    //MARK: - Did Scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.Scroll_TO_Load(scrollView: MoreCollectionView, url: moreURL)
    }
    
    //MARK: - Did Select Item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.Did_Select_Cell(index: indexPath.row)
    }
    
}
