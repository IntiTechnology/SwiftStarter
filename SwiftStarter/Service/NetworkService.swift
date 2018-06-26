//
//  NetworkService.swift
//  SwiftStarter
//
//  Created by Erick Manrique on 5/18/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    enum Result<T, V, U: Error> {
        case success(data: T, value: V)
        case failure(U?)
    }
    
    enum EmptyResult<U: Error> {
        case success
        case failure(U?)
    }
    
    typealias RequestResult = Result<Data, Any, FailureReason>
    typealias RequestCompletion = (_ result: RequestResult) -> Void
    
    typealias EmptyRequestResult = EmptyResult<FailureReason>
    typealias EmptyRequestCompletion = (_ result: EmptyRequestResult) -> Void
    
    func requestEmpty(url:String, parameters:[String:Any]? = nil, method:Alamofire.HTTPMethod, completion:@escaping EmptyRequestCompletion) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            
            if appMode == .Debug{
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
            }
            
            switch response.result {
            case .success:
                completion(.success)
            case .failure(_):
                if let statusCode = response.response?.statusCode,
                    let reason = FailureReason(rawValue: statusCode) {
                    completion(.failure(reason))
                }
                completion(.failure(nil))
            }
        }
    }
    
    enum GenResult<T:Decodable, U, V: Error> {
        case success(data: T, value: U)
        case failure(V?)
    }
    
    enum FailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias GenericResult<T:Decodable, U> = GenResult<T, U, FailureReason>
    typealias GenericCompletion<T:Decodable, U> = (_ result: GenericResult<T, U>) -> Void
    
    func requestData<T:Decodable, U>(url:String, parameters:[String:Any]? = nil, method: Alamofire.HTTPMethod, completion:@escaping GenericCompletion<T, U>) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            
            if appMode == .Debug{
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
            }
            
            switch response.result {
            case .success:
                guard let jsonData = response.data, let jsonValue = response.result.value else {
                    completion(.failure(nil))
                    return
                }
                do {
                    let obj = try JSONDecoder().decode(T.self, from: jsonData)
                    completion(.success(data:obj, value: jsonValue))
                } catch {
                    completion(.failure(nil))
                }
            case .failure(_):
                if let statusCode = response.response?.statusCode,
                    let reason = FailureReason(rawValue: statusCode) {
                    completion(.failure(reason))
                }
            }
        }
    }
    
    // this code here works but when i add 2 generic variables it breaks
//
//    typealias GenericResult<T:Decodable> = GenResult<T, Any, FailureReason>
//    typealias GenericCompletion<T:Decodable> = (_ result: GenericResult<T>) -> Void
//
//    func requestData<T:Decodable>(url:String, parameters:[String:Any]? = nil, method: Alamofire.HTTPMethod, completion:@escaping GenericCompletion<T>) {
//
//        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { (response) in
//
//            if appMode == .Debug{
//                print("Request: \(String(describing: response.request))")   // original url request
//                print("Response: \(String(describing: response.response))") // http url response
//                print("Result: \(response.result)")                         // response serialization result
//            }
//
//            switch response.result {
//            case .success:
//                guard let jsonData = response.data, let jsonValue = response.result.value else {
//                    completion(.failure(nil))
//                    return
//                }
//                do {
//                    let obj = try JSONDecoder().decode(T.self, from: jsonData)
//                    completion(.success(data:obj, value: jsonValue))
//                } catch {
//                    completion(.failure(nil))
//                }
//            case .failure(_):
//                if let statusCode = response.response?.statusCode,
//                    let reason = FailureReason(rawValue: statusCode) {
//                    completion(.failure(reason))
//                }
//            }
//        }
//    }

}








