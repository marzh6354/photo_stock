//
//  CollectionViewCell.swift
//  photo_stock
//
//  Created by Designer on 25.06.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
