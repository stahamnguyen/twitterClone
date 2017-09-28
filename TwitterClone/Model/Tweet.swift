//
//  Tweet.swift
//  TwitterClone
//
//  Created by Staham Nguyen on 27/09/2017.
//  Copyright © 2017 Staham Nguyen. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJSON = json["user"]
        self.user = User(json: userJSON)
        self.message = json["message"].stringValue
    }
}
