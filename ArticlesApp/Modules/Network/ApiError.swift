//
//  ApiError.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import Foundation

enum ApiError: LocalizedError {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    
    var errorDescription: String? {
        switch self {
        case .forbidden:
            return "You are not authorized to access this resource, sorry."
        case .notFound:
            return "URL Not found!"
        case .conflict:
            return "Technical Difficulties, we can't fetch the data"
        case .internalServerError:
            return "Server error!"
        }
    }
}
