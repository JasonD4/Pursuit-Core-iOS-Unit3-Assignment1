//
//  GotPeople.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jason on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


struct AllThePeople: Codable {
   let results: [User]
}

struct User: Codable {
    let gender: String
    let name: Names
    let location: Areas
    let email: String
    let picture: thisImage
}

struct Names: Codable {
    let title: String
    let first: String
    let last: String
    
}

struct Areas: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

struct thisImage: Codable {
    let large: URL
}
