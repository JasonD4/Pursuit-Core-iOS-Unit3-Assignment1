//
//  gettingStock.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jason on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


final class GettingStocks{
    
    
    private static func updateingStock() -> [Stocks] {
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
    
    static func getMonthYear(dateString: String) -> (month: String, year: String) {
        let components = dateString.components(separatedBy: "-")
        return (components[1], components[0])
    }
    
    public static func stockSections()  -> [[Stocks]]{
        // 1. get all stocks (once)
        let allPrices = updateingStock()
        // 2. create an 2d array of Stocks [[Stocks]]()
        var stockPriceSections = [[Stocks]]()
        
        stockPriceSections.append([Stocks]())
        var startIndex = 0
        var date = (month: "12", year: "2016")
        
        for stockPrice in allPrices {
            if date != getMonthYear(dateString: stockPrice.date){
            date = getMonthYear(dateString: stockPrice.date)
            stockPriceSections.append([Stocks]())
            startIndex += 1
            }
            else{
                stockPriceSections[startIndex].append(stockPrice)
            }
            

        }
        print(stockPriceSections.count)
        return stockPriceSections

    }

    
    
    
}

