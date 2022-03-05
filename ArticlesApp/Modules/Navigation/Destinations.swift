//
//  Destinations.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//


import UIKit

enum Destinations {
    case homeVC

    
    var viewcontroller: UIViewController {
        switch self {
        case .homeVC:
            return HomeVC()
        
        }
    }
}
