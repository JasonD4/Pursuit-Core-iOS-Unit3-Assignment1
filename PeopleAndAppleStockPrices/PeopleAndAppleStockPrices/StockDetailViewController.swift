//
//  StockDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jason on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {
    @IBOutlet weak var dateofStockView: UILabel!
    @IBOutlet weak var pictureOfResult: UIImageView!
    @IBOutlet weak var stockClosing: UILabel!
    @IBOutlet weak var stockOpening: UILabel!
    var stock: Stocks?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTheStock()
    }
    
    func updateTheStock(){
        
        dateofStockView.text = stock?.date
        stockOpening.text = "Opening Price \(String(format: "%.2f", stock!.open))"
        stockClosing.text = "Closing Price\(String(format: "%.2f", stock!.close))"
        if stock!.change > 0.0{
            pictureOfResult.image = UIImage.init(named: "thumbsUp")
           view.backgroundColor = .green
        }
        else if stock!.change < 0.0{
            pictureOfResult.image = UIImage.init(named: "thumbsDown")
            view.backgroundColor = .red
        }
        else if stock!.change == 0.0{
            pictureOfResult.image = UIImage.init(named: "meh")
            view.backgroundColor = .gray
        }
    }
}
