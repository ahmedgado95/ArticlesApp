//
//  UITableView+Extentions.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//


import UIKit

extension UITableView {
    func registerCell<Cell: UITableViewCell>(ofType: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeueCell<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        
        return cell
    }
    
}
