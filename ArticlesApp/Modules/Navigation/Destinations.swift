//
//  Destinations.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//


import UIKit

enum Destinations {
    case articlesVC

    
    var viewcontroller: UIViewController {
        switch self {
        case .articlesVC:
            let viewModel = ArticlesViewModel()
            return ArticlesVC(with: viewModel)
        
        }
    }
}
