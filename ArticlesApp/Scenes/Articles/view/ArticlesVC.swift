//
//  HomeVC.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ArticlesVC: UIViewController, Loadable {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private let viewModel: ArticlesViewModelProtocol
    let tableIdentifier = "ArticlesTableViewCell"
    // MARK: - Initialization
    init(with viewModel: ArticlesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupArticlesTableView()
        viewModel.getArticlesModelLApi()
        setUIText()
        configureBinding()
    }
    // MARK: - Methods
    private func setUIText() {
        self.title = "Articles"
    }
    
    private func setupArticlesTableView() {
        tableView.registerCell(ofType: ArticlesTableViewCell.self)
    }
    private func configureBinding() {
        viewModel.showProgress
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { [weak self]  in
                guard let self = self else { return }
                self.showLoading(show: $0)
            }).disposed(by: disposeBag)
        
        viewModel.error
            .subscribe(onNext: { [weak self] error in
                guard let self = self else { return }
                self.showAlert(alertTitle: "Something wrong!", alertMessge: error.localizedDescription, actionTitle: "Cancel")
            }).disposed(by: disposeBag)
        
        viewModel.articlesModelListSubject.bind(to: tableView.rx.items(cellIdentifier: tableIdentifier, cellType: ArticlesTableViewCell.self)) { _, articlesItem, cell in
            cell.setupCell(with: articlesItem)
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(ArticlesItem.self)
            .subscribe(onNext: { [weak self] article in
                guard let self = self else { return }
                self.viewModel.navigateToDetailsVC(article: article )
            }).disposed(by: disposeBag)
        
//        Observable
//            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(ArticlesItem.self))
//            .bind { [weak self] selectedIndex, branch in
//
//                print(selectedIndex, branch.name ?? "")
//        }
//        .disposed(by: disposeBag)
    }
    
 

}
