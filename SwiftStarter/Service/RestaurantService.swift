//
//  RestaurantService.swift
//  SwiftStarter
//
//  Created by Erick Manrique on 5/26/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

import Foundation
import Alamofire

class RestaurantService {
    
    let networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    enum Result<T, U: Error> {
        case success(data: T)
        case failure(U?)
    }
    
    enum FailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias RequestResult = Result<[Restaurant], FailureReason>
    typealias RequestCompletion = (_ result: RequestResult) -> Void
    
//    func getRestaurants(url:String, completion:@escaping RequestCompletion) {
//        networkService.request(url: url, method: .get) { (result) in
//            switch result {
//            case .success(data: let data, value: _):
//                do {
//                    let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
//                    completion(.success(data: restaurants))
//                } catch {
//                    completion(.failure(nil))
//                }
//            case .failure(let error):
//                guard let error = error else {
//                    completion(.failure(nil))
//                    return
//                }
//                let reason = FailureReason(rawValue: error.rawValue)
//                completion(.failure(reason))
////                completion(.failure(error))
//            }
//        }
//    }
    
//    typealias RequestResult = Result<[Restaurant], FailureReason>
//    typealias RequestCompletion = (_ result: RequestResult) -> Void
//    
//    func requestData<T:Decodable>(url:String, parameters:[String:Any]? = nil, method: Alamofire.HTTPMethod, completion:@escaping (T)->()) {
//        
//        networkService.request(url: url, parameters: parameters, method: method) { (result) in
//            switch result {
//            case .success(data: let data, value: _):
//                do {
//                    let obj = try JSONDecoder().decode(T.self, from: data)
//                    completion(.success(data: obj))
//                } catch {
//                    completion(.failure(nil))
//                }
//            case .failure(let error):
//                guard let error = error else {
//                    completion(.failure(nil))
//                    return
//                }
//                let reason = FailureReason(rawValue: error.rawValue)
//                completion(.failure(reason))
//            }
//        }
//    }
}
