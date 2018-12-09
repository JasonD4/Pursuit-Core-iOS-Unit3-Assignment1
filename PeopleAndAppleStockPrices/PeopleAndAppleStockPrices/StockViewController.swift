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
    
    var stockMarket = [Stocks]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockMarket = decodingStcoks.updateingStock()
        stockTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexpath = stockTableView.indexPathForSelectedRow,
            let stockDetail = segue.destination as? StockDetailViewController else{return}
        
        stockDetail.stock = stockMarket[indexpath.row]
        
    }
}







extension StockViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockMarket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "stock", for: indexPath) as? StockTableViewCell else {return UITableViewCell()}
        let currentStock = stockMarket[indexPath.row]
        
        cell.dateOfStock.text = currentStock.date
        cell.priceOfStock.text = String(format: "%.2f", currentStock.close)
        
        return cell
    }
    
    
}



