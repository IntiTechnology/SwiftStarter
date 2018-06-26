//
//  Restaurant.swift
//  SwiftStarter
//
//  Created by Erick Manrique on 5/26/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

import Foundation

class Restaurant: Decodable {
    var _id: String?
    var address: Address?
    var avgRating: Double?
    var cost: Double?
    var geo:[Double]?
    var name: String?
    var numberOfReviews: Int?
    var reviews: [String]?
    var sumOfRatings: Int?
    var primaryTag:String?
    var tags: [String]?
    var hoursOpen: [Schedule]?
//    var dishes: [Dish]?
    var nationality: String?
    var phone: String?
    var fax: String?
    var email: String?
    var website:String?
    var latestImage: String?
    
}

class Address: Decodable {
    var street: String?
    var city: String?
    var state: String?
    var zipCode: String?
}

class Schedule: Decodable {
    var start: Int?
    var end: Int?
}
