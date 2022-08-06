//
//  PhotosManager.swift
//  photo_stock
//
//  Created by Designer on 26.06.2022.
//

import Foundation
import Alamofire
import SDWebImage

struct PhotosManager {
    func performRequest(completion: @escaping([PicturesLinks]?) -> ()) {
        var decodedPhotos = [PicturesLinks]()
        let request = AF.request("https://api.unsplash.com/photos?client_id=_rdULVYAj-rHR4qC9e8bPp4C8lyPB5g7CtUikzalFko", method:.get).response {
            (responseData) in
            guard let data = responseData.data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let photos = try decoder.decode([PhotoData].self, from: data)
                
                
                
                for photo in photos {
                    let user = User(profile_image: photo.user.profile_image.medium, name: photo.user.name, username: photo.user.username)
                    decodedPhotos.append(PicturesLinks(image: UIImage(named: "1")!, like: false, tag: false, imageLink: photo.urls.regular, user: user))
                    //print(photo.urls.full)
                }
                completion(decodedPhotos)
                
                
            }
            catch {
                print(error)
            }
        }
        
        request.responseJSON {
            (data) in
            //print(data)
        }
        
    }
}
