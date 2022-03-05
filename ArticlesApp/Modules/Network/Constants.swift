//
//  Constants.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import Foundation

struct Constants {
    //The API's base URL
    static let BASEURL = ""
    static let IMAGEBASEURL = ""

    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let APIKEY = "api_key"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}
