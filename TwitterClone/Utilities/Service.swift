//
//  Service.swift
//  TwitterClone
//
//  Created by Staham Nguyen on 28/09/2017.
//  Copyright © 2017 Staham Nguyen. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")

struct Service {
    
    static let shared = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
}
