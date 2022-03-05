//
//  ArticlesTableViewCell.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    @IBOutlet weak var articlesLabel: UILabel!
    @IBOutlet weak var articlesImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(with dataModel: ArticlesItem) {
        articlesLabel.text = dataModel.title
    }
}
