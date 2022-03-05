//
//  ArticlesModelsAPI.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import Foundation
import Alamofire


enum ArticlesModelsAPI: URLRequestConvertible {
    case articles(period: String)
}

extension ArticlesModelsAPI: ApiRouter {
    var path: String {
        switch self {
        case .articles(let period) :
            return "\(period).json"
        
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .articles:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .articles(_ ):
            return [
                Constants.Parameters.APIKEY : Constants.APIKEY,
            
            ]
        }
    }
    

}
