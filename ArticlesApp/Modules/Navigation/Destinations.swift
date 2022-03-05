//
//  Destinations.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//


import UIKit

enum Destinations {
    case articlesVC
    case detailsVC(articlesVC: ArticlesItem)

    var viewcontroller: UIViewController {
        switch self {
        case .articlesVC:
            let viewModel = ArticlesViewModel()
            return ArticlesVC(with: viewModel)
        
        case .detailsVC(let articlesDetails):
            let vc = ArticlesDetailsVC()
            vc.articlesDetails = articlesDetails
            return vc
        }
    }
}
