//
//  HomeDatasourceVC.swift
//  TwitterClone
//
//  Created by Staham Nguyen on 27/09/2017.
//  Copyright © 2017 Staham Nguyen. All rights reserved.
//

import LBTAComponents
import TRON

class HomeDatasourceVC: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Something went wrong with the connection. Please try again later."
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        errorMessageLabel.isHidden = true
        
        collectionView?.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9254901961, blue: 0.9450980392, alpha: 1)
        
        setupNavigationBarItems()
        
        Service.shared.fetchHomeFeed { (homeDatasource, error) in
            if let error = error {
                print("Get error when fetching JSON")
                self.errorMessageLabel.isHidden = false
                
                if let apiError = error as? APIError<JSONError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Invalid JSON"
                    }
                }
                return
            }
            
            self.errorMessageLabel.isHidden = true
            self.datasource = homeDatasource
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 65)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
            
            let estimatedHeight = estimatedHeightForText(user.bioText)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 66)
            
        } else if indexPath.section == 1 {
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
            
            let estimatedHeight = estimatedHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    private func estimatedHeightForText(_ text: String) -> CGFloat {
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
    }
}


