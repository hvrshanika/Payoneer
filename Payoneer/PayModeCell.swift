//
//  PayModeCell.swift
//  Payoneer
//
//  Created by Shanika Vithanage on 5/23/21.
//

import UIKit

class PayModeCell: UICollectionViewCell {
    static let reuseId = "PayModeCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
}

class PayModeHeaderCell: UICollectionReusableView {
    static let reuseId = "PayModeHeaderCell"
    
    @IBOutlet weak var lblName: UILabel!
}
