//
//  PicturesLinks.swift
//  photo_stock
//
//  Created by Marzhan Dossybayeva on 07.05.2022.
//

import Foundation
import UIKit

struct PicturesLinks {
    
    var image: UIImage
    var like: Bool
    var tag: Bool
    var imageLink: String
    var user: User
}

struct User {
    let profile_image: String
    let name: String
    let username: String
}
