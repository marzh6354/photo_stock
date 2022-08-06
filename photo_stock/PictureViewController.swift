//
//  PictureViewController.swift
//  photo_stock
//
//  Created by Marzhan Dossybayeva on 24.04.2022.
//

import UIKit
import SDWebImage

class PictureViewController: UIViewController {

    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var profileUsername: UILabel!
    @IBOutlet weak var profileName: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var downloadButton: UIButton!
    var picture: PicturesLinks? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if picture != nil {
            img.image = picture!.image
        }
        
        profileImage.layer.cornerRadius = 20
        img.layer.cornerRadius = 20
        downloadButton.layer.cornerRadius = downloadButton.frame.size.width / 20
        downloadButton.clipsToBounds = true
        if let imageURL = URL(string: picture?.user.profile_image ?? "") {
            let scale = UIScreen.main.scale
            let thumbnailSize = CGSize(width: 200 * scale, height: 200 * scale)
            profileImage.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "1"), context: [.imageThumbnailPixelSize : thumbnailSize])
        }
        
        if let name = picture?.user.name {
            profileName.text = name
        }
        
        if let username = picture?.user.username {
            profileUsername.text = username
        }
        
        if let mainImageURL = URL(string: picture?.imageLink ?? "") {
            let thumbnailSize = CGSize(width: 40, height: 40)
            img.sd_setImage(with: mainImageURL, placeholderImage: #imageLiteral(resourceName: "1"), context: [.imageThumbnailPixelSize : thumbnailSize])
        }
        
    }
    
    @IBAction func likeClicked(_ sender: Any) {
        if let likeStat = picture?.like {
            picture?.like = !likeStat
        }
        
        if picture?.like ?? true {
            if let image = UIImage(named: "favRed") {
                likeButton.setImage(image, for:.normal)
            }
        } else {
            if let image = UIImage(named: "Heart_inactive") {
                likeButton.setImage(image, for:.normal)
            }
        }
        
        
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
