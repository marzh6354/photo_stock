//
//  FavoritesViewController.swift
//  photo_stock
//
//  Created by Marzhan Dossybayeva on 17.04.2022.
//

import UIKit

class FavoritesViewController: UIViewController {
    var photos = [PicturesLinks]()
    var selectedImage = 0

    @IBOutlet weak var collectionView: UICollectionView!
    var offset = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

//
//        photos.append(PicturesLinks(image: UIImage(named: "1")!, like: true, tag: false, imageLink: "", user: <#User#>))
//        photos.append(PicturesLinks(image: UIImage(named: "4")!, like: true, tag: true, imageLink: ""))
//        photos.append(PicturesLinks(image: UIImage(named: "fav1")!, like: true, tag: false, imageLink: ""))
//        photos.append(PicturesLinks(image: UIImage(named: "1")!, like: true, tag: false, imageLink: ""))
        
        
    }
    @IBAction func likePressed(_ sender: Any) {
    }
}


extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        if let image = UIImage(named: "favRed") {
            cell.likeButton.setImage(image, for:.normal)
        }
         
        cell.img.image = photos[indexPath.row].image
        cell.img.layer.cornerRadius = 20

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage = indexPath.row
        performSegue(withIdentifier: "toPostVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostVC" {
            let destinationVC = segue.destination as! PictureViewController
            destinationVC.picture = photos[selectedImage]
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let fullSize = CGSize(width: collectionView.bounds.width, height: 205)
        let halfSize = CGSize(width: collectionView.bounds.width / 2, height: 205)
        
        
        if offset == 2 {
            offset = 0
            return fullSize
        }
        offset += 1
        
        return halfSize
    }
    
    
}
