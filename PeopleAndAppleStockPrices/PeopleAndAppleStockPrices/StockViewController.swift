//
//  StockViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jason on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class StockViewController: UIViewController {
    
    @IBOutlet weak var stockTableView: UITableView!
    
    var stockMarket = [[Stocks]]()
    
    public let months = [1:"January", 2:"February", 3:"March", 4:"April", 5:"May", 6:"June", 7:"July", 8:"August", 9:"September", 10: "October", 11: "November", 12: "December" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stockMarket = GettingStocks.stockSections()

        stockTableView.dataSource = self
        stockTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexpath = stockTableView.indexPathForSelectedRow,
            let stockDetail = segue.destination as? StockDetailViewController else{return}
        
        stockDetail.stock = stockMarket[indexpath.section][indexpath.row]
        
    }
}







extension StockViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stockMarket.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockMarket[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "stock", for: indexPath) as? StockTableViewCell else {return UITableViewCell()}
        let currentStock = stockMarket[indexPath.section][indexPath.row]
        
        cell.dateOfStock.text = currentStock.date
        cell.priceOfStock.text = String(format: "%.2f", currentStock.close)
        
        return cell
    }
    
    
}

extension StockViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      let monthDate = GettingStocks.getMonthYear(dateString:(stockMarket[section].first?.date)!) // 2016-12-01 => December-2016
        var avg = stockMarket[section].reduce(0){($0 + $1.open)}
        avg = avg / Double(stockMarket[section].count)
        guard let number = Int(monthDate.month) else{return "error"}
        return "\(months[Int(number)] ?? "nil"), \(monthDate.year)     Avg for the Month \(String(format:"%.2f",avg))"
    }
}
