//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Staham Nguyen on 27/09/2017.
//  Copyright © 2017 Staham Nguyen. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        print("Ready to parse JSON: \n", json)
        
        var users = [User]()
        
        let usersArray = json["users"].array
        for userJSON in usersArray! {
            let name = userJSON["name"].stringValue
            let username = userJSON["username"].stringValue
            let bio = userJSON["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        
        self.users = users
    }
    
    let tweets: [Tweet] = {
        let stahamUser = User(name: "Staham Nguyen", username: "@stahamnguyen", bioText: "iOS Developer, freelance photographer, cryptocurrency investor", profileImage: #imageLiteral(resourceName: "profileStaham"))
        let tweet1 = Tweet(user: stahamUser, message: "I believe in Trump thought he's kinda bad at the moment")
        let tweet2 = Tweet(user: stahamUser, message: "Patience's not gonna work on Kim")
        return [tweet1, tweet2]
    }()
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }
        
        return users[indexPath.row]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            return tweets.count
        }
        
        return users.count
    }
}
