//
//  Navigator.swift
//  Universal Linkage
//
//  Created by Kyle Lee on 1/25/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

struct Navigator {
    
    func getDestination(for url: URL) -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        let tabBarController = storyboard.instantiateInitialViewController() as? UITabBarController
        
        tabBarController?.selectedIndex = 1
        
        let destination = Destination(for: url)
        
        switch destination {
            
        case .users: return tabBarController
            
        case .userDetails(let userId):
            
            let navController = tabBarController?.viewControllers?[1] as? UINavigationController
            
            guard let userDetailsVC = storyboard.instantiateViewController(withIdentifier: "UserDetailsVC") as? UserDetailsViewController else { return nil }
            
            userDetailsVC.userId = userId
            
            navController?.pushViewController(userDetailsVC, animated: false)
            
            return tabBarController
            
        case .safari: return nil
        }
    }
    
    enum Destination {
        
        case users
        
        case userDetails(Int)
        
        case safari
        
        init(for url: URL) {
            
            print(url.lastPathComponent)
            
            if url.lastPathComponent == "users" {
                
                self = .users
                
            } else if let userId = Int(url.lastPathComponent) {
                
                self = .userDetails(userId)
                
            } else {
                
                self = .safari
            }
        }
    }
}
