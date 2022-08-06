//
//  MyAlbumViewController.swift
//  photo_stock
//
//  Created by Marzhan Dossybayeva on 07.05.2022.
//

import UIKit


protocol LikeProtocol {
    func likePressedForCell(index: Int)
}

class MyAlbumViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var pictures = [PicturesLinks]()
    var selectedPicture = 0
    var photosManager = PhotosManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        photosManager.performRequest(completion: {photo in
            if let photo = photo {
                self.pictures = photo
                self.tableView.reloadData()
            }
        })
        
        print(pictures)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostVC" {
            let destinationVC = segue.destination as! PictureViewController
            destinationVC.picture = pictures[selectedPicture]
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPicture = indexPath.row
        performSegue(withIdentifier: "toPostVC", sender: self)
    }
    
  
    

}

// MARK: Cell protocol

extension MyAlbumViewController: LikeProtocol {
    func likePressedForCell(index: Int) {
        pictures[index].like = !pictures[index].like
        tableView.reloadData()
    }
}


// MARK: Table view delegates

extension MyAlbumViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoTableViewCell
        cell.initialize(imageLink: pictures[indexPath.row].imageLink, index: indexPath.row)
        
        cell.delegate = self
        
        if pictures[indexPath.row].like {
            if let image = UIImage(named: "favRed") {
                cell.likeButton.setImage(image, for:.normal)
            }
        } else {
            if let image = UIImage(named: "Heart_inactive") {
                cell.likeButton.setImage(image, for:.normal)
            }
        }
        
        if pictures[indexPath.row].tag {
                    cell.tagImage.isHidden = false
                } else {
            cell.tagImage.isHidden = true
        }
        
        return cell
    }
    
}
