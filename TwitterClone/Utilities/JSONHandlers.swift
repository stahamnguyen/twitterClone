//
//  JSONHandlers.swift
//  TwitterClone
//
//  Created by Staham Nguyen on 28/09/2017.
//  Copyright © 2017 Staham Nguyen. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

class Home: JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        print("Ready to parse JSON: \n", json)
        
        var users = [User]()
        
        let usersArray = json["users"].array
        for userJSON in usersArray! {
            let user = User(json: userJSON)
            users.append(user)
        }
        
        self.users = users
    }
}

class JSONError: JSONDecodable {
    required init(json: JSON) throws {
        print("JSON error")
    }
}
