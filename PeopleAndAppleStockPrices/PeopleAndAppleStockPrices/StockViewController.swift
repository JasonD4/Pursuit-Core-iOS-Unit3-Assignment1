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
    //    var stockSection = [[Stocks]]()
    
    //var y = 2016
    
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
        switch section {
        case 0:
            return "December"
        case 1:
            return "January"
        case 2:
            return "Febuary"
        case 3:
            return "March"
        case 4:
            return "April"
        case 5:
            return "May"
        case 6:
            return "June"
        case 7:
            return "July"
        case 8:
            return "August"
        case 9:
            return "September"
        case 10:
            return "October"
        case 11:
            return "November"
            
        default:
            return "bad"
        }
    }
}
