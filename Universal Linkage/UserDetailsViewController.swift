//
//  UserDetailsViewController.swift
//  Universal Linkage
//
//  Created by Kyle Lee on 1/25/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var userId: Int!
    
    let networking = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getUser(with: userId)
    }
    
    func getUser(with userId: Int) {
        
        networking.request(endpoint: .userDetails(userId)) { (user: User) in
            
            self.updateView(with: user)
        }
    }
    
    func updateView(with user: User) {
        
        label.text = "\(user.name) is \(user.age) years old!"
    }
}
