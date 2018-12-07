//
//  PeopleDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jason on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class PeopleDetailViewController: UIViewController {

    @IBOutlet weak var personPicture: UIImageView!
    @IBOutlet weak var locationOfPerson: UILabel!
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var emails: UILabel!
    var person: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTheUi()

        // Do any additional setup after loading the view.
    }
    
    func updateTheUi(){
        
        do{
            let peopleImageData = try Data(contentsOf: person!.picture.large)
            personPicture.image = UIImage.init(data: peopleImageData)
            
        }catch{
            print(error)
        }
    }

}
