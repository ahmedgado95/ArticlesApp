//
//  Loadable.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import UIKit

protocol Loadable {
    func showLoading(show: Bool)
}

extension Loadable where Self: UIViewController {
    /// show or hide the activity loader
    /// - Parameter show: to decide to show or hide the activity indicator
    func showLoading(show: Bool) {
        if show {
            showLoading()
        } else {
            hideLoading()
        }
    }

    /// create an activity indicator and add it to my view and start animating
    private func showLoading() {
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityView.center = view.center
        view.addSubview(activityView)
        activityView.startAnimating()
    }

    /// stop animation the indicator view and remove it from the parent view
    private func hideLoading() {
        guard let firstView = self.view.subviews.filter({ type(of: $0) == UIActivityIndicatorView.self }).first,
            let progress = firstView as? UIActivityIndicatorView else { return }
        progress.stopAnimating()
        progress.removeFromSuperview()
    }
}

extension UIViewController {
    func showAlert(alertTitle: String, alertMessge: String, actionTitle: String) {
        let alertController = UIAlertController(title: alertTitle, message: alertMessge, preferredStyle: .alert)
        let oKAction = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alertController.addAction(oKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
