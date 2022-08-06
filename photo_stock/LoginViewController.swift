//
//  LoginViewController.swift
//  photo_stock
//
//  Created by Marzhan Dossybayeva on 23.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UIStackView!
    @IBOutlet weak var passwordField: UIStackView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameField.layer.cornerRadius = 25
        passwordField.layer.cornerRadius = 25
        loginButton.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginUser(_ sender: Any) {
        print("Button is pressed \(usernameTextView.text)")
        
        if (usernameTextView?.text == "marzhan" && passwordTextView?.text == "hello") {
            performSegue(withIdentifier: "fromLoginToHome", sender: self)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
