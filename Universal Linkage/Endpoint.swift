//
//  Endpoint.swift
//  Universal Linkage
//
//  Created by Kyle Lee on 1/25/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

enum Endpoint {
    
    case users
    case userDetails(Int)
    
    var url: URL {
        
        var baseUrl = "https://kl-universal-links-server.herokuapp.com/api"
        
        switch self {
            
        case .users: baseUrl.append("/users")
            
        case .userDetails(let id): baseUrl.append("/users/\(id)")
        }
        
        return URL(string: baseUrl)!
    }
}
