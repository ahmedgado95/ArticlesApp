//
//  ArticlesDetailsVC.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import UIKit

class ArticlesDetailsVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    // MARK: - Properties
    var articlesDetails : ArticlesItem? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpDetails()
    }
    // MARK: - Methods
    private func setUpDetails() {
        detailsImageView.loadFromUrl(stringUrl: articlesDetails?.media.last?.mediaMetadata.last?.url ?? "")
        titelLabel.text = articlesDetails?.title
        descriptionTextView.text = articlesDetails?.abstract
    }

}
