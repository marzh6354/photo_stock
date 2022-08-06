//
//  PhotoTableViewCell.swift
//  photo_stock
//
//  Created by Marzhan Dossybayeva on 07.05.2022.
//

import UIKit
import SDWebImage


class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tagImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    var index = 0
    
    
    var delegate: LikeProtocol? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialize(imageLink: String, index: Int) {
        self.index = index
        if let imageURL = URL(string: imageLink) {
            let scale = UIScreen.main.scale
            let thumbnailSize = CGSize(width: 200 * scale, height: 200 * scale)
            img.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "1"), context: [.imageThumbnailPixelSize : thumbnailSize])
        }
    }
    
    @IBAction func likePressed(_ sender: Any) {
        delegate?.likePressedForCell(index: self.index)
    }
    
}
