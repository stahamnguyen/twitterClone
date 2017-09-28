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
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        
        guard let usersJSONArray = json["users"].array, let tweetJSONArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON"])
        }
        self.users = usersJSONArray.map({ return User(json: $0) })
        self.tweets = tweetJSONArray.map({ return Tweet(json: $0) })
    }
    
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
