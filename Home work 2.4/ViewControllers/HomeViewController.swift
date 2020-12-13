//
//  HomeViewController.swift
//  Home work 2.4
//
//  Created by EKATERINA  KUKARTSEVA on 13.12.2020.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Привет \(user.login)"
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
