//
//  gettingStock.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jason on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

final class decodingStcoks{
    
    
static func updateingStock() -> [Stocks] {
    var currentStock = [Stocks]()
    if let path = Bundle.main.path(forResource: "applstockinfo", ofType: "json"){
        let myURL = URL.init(fileURLWithPath: path)
        if let stock = try? Data.init(contentsOf: myURL){
            do{
                let stocks = try JSONDecoder().decode([Stocks].self, from: stock)
                currentStock = stocks
            }catch{
                print("error is: \(error)")
            }
        }
    }
    return currentStock
}
    
    
}
