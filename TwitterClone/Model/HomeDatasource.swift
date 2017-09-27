//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Staham Nguyen on 27/09/2017.
//  Copyright © 2017 Staham Nguyen. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let stahamUser = User(name: "Staham Nguyen", username: "@stahamnguyen", bioText: "iOS Developer, freelance photographer, cryptocurrency investor", profileImage: #imageLiteral(resourceName: "profileStaham"))
        
        let trumpUser = User(name: "Donald Trump", username: "@donaldtrump", bioText: "US President", profileImage: #imageLiteral(resourceName: "profileTrump"))
        
        let kimUser = User(name: "Kim Jong Un", username: "@kimjongun", bioText: "Trump will pay for what he said. My people will do anything to defeat the US and protect our our rights. No country can compromise our national benefits, including the US", profileImage: #imageLiteral(resourceName: "profileKim"))
        
        return [stahamUser, trumpUser, kimUser]
    }()
    
    let tweets = ["tweet1", "tweet2"]
    
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
        return users[indexPath.row]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            return tweets.count
        }
        
        return users.count
    }
}
