//
//  ArticlesViewModel.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol ArticlesViewModelProtocol {
    var articlesModelListSubject: BehaviorRelay<[ArticlesItem]> { get }
    func getArticlesModelLApi()
    func navigateToDetailsVC()
    var showProgress: PublishSubject<Bool> { get }
    var error: PublishSubject<Error> { get }
}

class ArticlesViewModel: ArticlesViewModelProtocol {
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private var articlesModelsApi: ApiClientProtocol
    private var totalPages: Int = 0
    private var pageNumber: Int = 7
    let error = PublishSubject<Error>()
    let showProgress = PublishSubject<Bool>()
    let articlesModelListSubject = BehaviorRelay<[ArticlesItem]>(value: [])
    private var articlesModelsList: [ArticlesItem] = [] {
        didSet {
            self.articlesModelListSubject.accept(articlesModelsList)
        }
    }
    
    // MARK: - Initialization
    init(articlesModelsApi: ApiClientProtocol = ApiClient()) {
        self.articlesModelsApi = articlesModelsApi
    }
    
    // MARK: - Methods
  
    
    func navigateToDetailsVC(modelNiceName: String, modelName: String) {
//        try? AppNavigator().push(.detailsVC(carMake: self.carMakeName, modelNiceName: modelNiceName, modelName: modelName))
    }
  
    func getArticlesModelLApi() {
        self.showProgress.onNext(true)
        self.articlesModelsApi.request(ArticlesModelsAPI.articles(period: "\(pageNumber)"), decodingType:  ArticlesModel.self).observe(on: MainScheduler.instance)
            .subscribe(onNext: { response in
                self.articlesModelsList.append(contentsOf: response.results )
                self.totalPages = 30
                self.pageNumber += 1
                self.showProgress.onNext(false)
            }, onError: { error in
                self.error.onNext(error)
                self.showProgress.onNext(false)
            }).disposed(by: disposeBag)
    }

    func navigateToDetailsVC() {
        print("navigateToDetails")
    }
    
}
