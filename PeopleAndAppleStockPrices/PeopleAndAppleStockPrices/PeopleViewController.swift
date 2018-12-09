//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var peopleSearchBar: UISearchBar!
    @IBOutlet weak var peopleTableView: UITableView!
    
    var people = [User](){
        didSet{
            peopleTableView.reloadData()
        }
    }
  override func viewDidLoad() {
    super.viewDidLoad()
    people = GettingPeople.update()
    peopleTableView.dataSource = self
    peopleSearchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = peopleTableView.indexPathForSelectedRow,
            let PeopleDetailViewController = segue.destination as? PeopleDetailViewController else { return }
        let peoples = people[indexPath.row]
        
        PeopleDetailViewController.person = peoples
    }



}


extension PeopleViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath)
        
        let peopleAtCell = people[indexPath.row]
        
        cell.textLabel?.text =  peopleAtCell.name.first.capitalized + " " + peopleAtCell.name.last.capitalized
        cell.detailTextLabel?.text = peopleAtCell.location.state.capitalized
        
        DispatchQueue.global().async {
      
                do{
                    let peopleImageData = try Data(contentsOf: peopleAtCell.picture.large)
                    DispatchQueue.main.async{
                    cell.imageView!.image = UIImage.init(data: peopleImageData)
                    }
                }catch{
                    print(error)
            }
        }
        return cell
    }
    
    
}

extension PeopleViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else{return}
    people.filter(){return ($0.name.first).lowercased().contains(text.lowercased())}
    }
}
