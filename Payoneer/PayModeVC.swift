//
//  ViewController.swift
//  Payoneer
//
//  Created by Shanika Vithanage on 5/22/21.
//

import UIKit

class PayModeVC: UIViewController {

    @IBOutlet weak var payModeCollection: UICollectionView!
    
    private var viewModel: PayModeVM = PayModeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        adjustConstraints()
        
        viewModel.getAllPayModes()
    }
    
    private func bind() {
        // Binding paymode list
        viewModel.payModeList.bind { [weak self] modes in
            self?.payModeCollection.reloadData()
        }
        
        // Binding errors
        viewModel.payModeListError.bind { [weak self] (error) in
            if !error.isEmpty {
                SharedMethods.showMessage("Error", message: error, onVC: self)
            }
        }
    }
    
    private func adjustConstraints() {
        // Optimized for iPhone SE and small screen sizes
        if UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.bounds.width < 400 {
            NSLayoutConstraint.activate([
                payModeCollection.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10),
                payModeCollection.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10)
            ])
        }
    }

}

extension PayModeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if viewModel.payModeList.value.count > 0 {
            collectionView.backgroundView = nil
            return viewModel.payModeList.value.count
        } else {
            let messageLabel = UILabel(frame: CGRect(x: 5, y: 0, width: view.bounds.size.width - 5, height: view.bounds.size.height))
            
            messageLabel.text = NSLocalizedString("No payment methods found", comment: "")
            messageLabel.textColor = UIColor.lightGray
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont.systemFont(ofSize: 15)
            messageLabel.sizeToFit()
            
            collectionView.backgroundView = messageLabel
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 300, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PayModeHeaderCell.reuseId, for: indexPath) as? PayModeHeaderCell {
            // Group label has underscore - so not sure it should be shown in the UI
//            let groupedPayMode = viewModel.payModeList.value[indexPath.section]
//            sectionHeader.lblName.text = groupedPayMode.groupName
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.payModeList.value[section].payModes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return CGSize(width: 110, height: 110)
        } else {
            return CGSize(width: 150, height: 150)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PayModeCell.reuseId,
                                                            for: indexPath) as? PayModeCell else {
            return UICollectionViewCell()
        }
        
        let groupedPayMode = viewModel.payModeList.value[indexPath.section]
        let payMode = groupedPayMode.payModes[indexPath.row]
        
        cell.lblName.text = payMode.name
                                    
        if let url = payMode.logoUrl {
            ImageCache.publicCache.load(url: url as NSURL, item: payMode) { (fetchedItem, image) in
                if let img = image {
                    cell.imageView.image = img
                } else {
                    cell.imageView.image = UIImage(systemName: "circle.grid.2x2.fill")
                }
            }
        }
        
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    // Align item to left if there's only one item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.numberOfItems(inSection: section) == 1 {
            var cellWidth = 150
            if UIDevice.current.userInterfaceIdiom == .phone {
                cellWidth = 110
            }
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: collectionView.frame.width - CGFloat(cellWidth))
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
}

