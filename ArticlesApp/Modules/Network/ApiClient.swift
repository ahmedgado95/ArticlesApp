//
//  ApiClient.swift
//  ArticlesApp
//
//  Created by ahmed gado on 05/03/2022.
//

import Foundation
import Alamofire
import RxSwift

protocol ApiClientProtocol {
    func request<T: Codable>(_ urlConvertible: URLRequestConvertible, decodingType: T.Type) -> Observable<T>
}

class ApiClient: ApiClientProtocol {
    
    func request<T: Codable> (_ urlConvertible: URLRequestConvertible, decodingType: T.Type) -> Observable<T> {
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable<T>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = AF.request(urlConvertible).responseDecodable { (response: DataResponse<T, AFError>) in
                if let networkResponse = response.response {
                    self.logRequest(response: networkResponse)
                }
                //Check the result from Alamofire's response and check if it's a success or a failure
                switch response.result {
                case .success(let value):
                    if let data = response.data , let utf8Text = String(data: data, encoding: .utf8) {
                        if let networkResponse = response.response {
                            self.logResponse(response: networkResponse, data: data, jsonData: utf8Text)
                        }
                    }
                    //Everything is fine, return the value in onNext
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    //Something went wrong, switch on the status code and return the error
                    switch response.response?.statusCode {
                    case 403:
                        observer.onError(ApiError.forbidden)
                    case 404:
                        observer.onError(ApiError.notFound)
                    case 409:
                        observer.onError(ApiError.conflict)
                    case 500:
                        observer.onError(ApiError.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
            }
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    private func logRequest(response: HTTPURLResponse) {
        print("""
        URL:-
            \(String(describing: response.url))
        """)
    }
    
    private func logResponse(response: HTTPURLResponse, data: Data?, jsonData: String) {
        print("json:-",jsonData)
    }
}

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return jsonObject.flatMap { $0 as? [String: Any] } ?? [:]
    }
    
    func toData() -> Data? {
        try? JSONSerialization.data(withJSONObject: self.toDictionary(), options: .prettyPrinted)
    }
}
