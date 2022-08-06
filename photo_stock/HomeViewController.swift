//
//  ViewController.swift
//  photo_stock
//
//  Created by Marzhan Dossybayeva on 16.04.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var pictures: [UIImageView]!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var bottom_menu: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in pictures {
            i.layer.cornerRadius = 20
        }
        
        bottom_menu.layer.cornerRadius = 30
        
        for item in buttons {
            item.layer.cornerRadius = 0.5 * item.bounds.width        }
        
    }
    
    

}

