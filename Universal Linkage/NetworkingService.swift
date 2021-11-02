//
//  NetworkingService.swift
//  Universal Linkage
//
//  Created by Kyle Lee on 1/25/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

class NetworkingService {
    
    func request<T: Decodable>(endpoint: Endpoint, completion: @escaping (T) -> Void) {
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: endpoint.url) { (data, _, _) in
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data!)
                
                DispatchQueue.main.async { completion(object) }
                
            } catch {
                
                print(error)
            }
        }
        
        task.resume()
    }
}
