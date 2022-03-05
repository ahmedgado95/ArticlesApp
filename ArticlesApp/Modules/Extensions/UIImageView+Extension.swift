//
//  UIImageView+Extension.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func loadFromUrl(stringUrl : String) {
        
        let imageBase = stringUrl
        let imageurl = URL(string : imageBase.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)
       
        
        self.kf.setImage(with: imageurl , placeholder: nil, options: [.cacheOriginalImage])
    }
    

}
