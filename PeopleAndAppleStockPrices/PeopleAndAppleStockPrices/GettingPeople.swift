//
//  gettingPeople.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jason on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

final class GettingPeople{
    
    static func update() -> [User] {
        var users = [User]()
        if let path = Bundle.main.path(forResource: "userinfo", ofType: "json"){
            let myURL = URL.init(fileURLWithPath: path)
            if let people = try? Data.init(contentsOf: myURL){
                do{
                    let allPeople = try JSONDecoder().decode(AllThePeople.self, from: people)
                    users = allPeople.results.sorted{$0.name.first < $1.name.first}
                }catch{
                    print("error is: \(error)")
                }
            }
        }
        return users
    }
}
