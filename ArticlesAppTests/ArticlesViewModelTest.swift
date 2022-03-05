//
//  ArticlesViewModelTest.swift
//  ArticlesAppTests
//
//  Created by ahmed gado on 05/03/2022.
//

import XCTest
@testable import ArticlesApp
import OHHTTPStubs
import RxSwift
import RxCocoa
class ArticlesViewModelTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {

        //Given
        stub(condition: {(urlRequest)-> Bool in
            return urlRequest.url?.absoluteString.contains("7.json") ?? false
            
        }){(urlRequest) -> HTTPStubsResponse in
            let jsonObject :[String : Any] = [
                    "uri": "nyt://article/d6839d8a-c128-5ceb-953d-6da3152ef9e7",
                    "url": "https://www.nytimes.com/2022/02/28/us/politics/ukraine-russia-microsoft.html",
                    "id": 100000008232548,
                    "asset_id": 100000008232548,
            
                ]
            return HTTPStubsResponse(jsonObject: jsonObject, statusCode: 200, headers: nil)
        }
        var expectedResponse : [ArticlesItem]? = nil
        let articlesModelsApi: ApiClientProtocol = ApiClient()
        let disposeBag = DisposeBag()
        // when
        articlesModelsApi.request(ArticlesModelsAPI.articles(period: "7"), decodingType:  ArticlesModel.self).observe(on: MainScheduler.instance)
            .subscribe(onNext: { response in
                expectedResponse = response.results
            }, onError: { error in
                
            }).disposed(by: disposeBag)
        
        // Then
        XCTAssertNil(expectedResponse)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
