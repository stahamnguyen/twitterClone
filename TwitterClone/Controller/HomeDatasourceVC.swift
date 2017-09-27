//
//  HomeDatasourceVC.swift
//  TwitterClone
//
//  Created by Staham Nguyen on 27/09/2017.
//  Copyright © 2017 Staham Nguyen. All rights reserved.
//

import LBTAComponents

class HomeDatasourceVC: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}


