//
//  PhotoData.swift
//  photo_stock
//
//  Created by Designer on 26.06.2022.
//

import Foundation

struct PhotoData: Codable {
    let width: Int
    let height: Int
    let urls: URLs
    let user: UserData
}

struct URLs: Codable {
    let regular: String
    let thumb: String
}

struct UserData: Codable {
    let profile_image: ProfileImageData
    let name: String
    let username: String
}

struct ProfileImageData: Codable {
    let medium: String
}
