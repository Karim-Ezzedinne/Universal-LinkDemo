//
//  UsersViewController.swift
//  Universal Linkage
//
//  Created by Kyle Lee on 1/25/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

class UsersViewController: UITableViewController {

    var users = [User]()
    
    let networking = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        
        getUsers()
    }
    
    func getUsers() {
        
        networking.request(endpoint: .users) { (users: [User]) in
            
            self.users = users
            
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.backgroundColor = .clear
        
        let user = users[indexPath.row]
        
        cell.textLabel?.textColor = .white
        
        cell.textLabel?.text = user.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = users[indexPath.row]
        
        performSegue(withIdentifier: "segue", sender: user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard
            let userDetailsVC = segue.destination as? UserDetailsViewController,
            let user = sender as? User
            else { return }
        
        userDetailsVC.userId = user.id
    }

}
