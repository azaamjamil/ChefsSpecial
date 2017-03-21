//
//  SearchTableViewController.swift
//  ChefSpecial
//
//  Created by Imran Khan on 3/18/17.
//  Copyright © 2017 bk8323. All rights reserved.
//

import UIKit
import Foundation

class SearchTableViewController: UITableViewController,UISearchResultsUpdating, UISearchBarDelegate
{
    let restaurantProduct = ["Torchy's Taco", "Pluckers", "Madame Mam's"]
    var filteredRestaurant = [String]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredRestaurant = restaurantProduct
        
        //Setup
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        
        //Background dims when it is clicked on
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        //Top of the view
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        //Reload Data
        self.tableView.reloadData()
    
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Filtered count
        if self.resultSearchController.isActive
        {
            return self.filteredRestaurant.count
        }
        //Total count
        else
        {
            return self.filteredRestaurant.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        if self.resultSearchController.isActive
        {
            cell.textLabel?.text = self.filteredRestaurant[indexPath.row]
        }
            //Total count
        else
        {
            cell.textLabel?.text = self.restaurantProduct[indexPath.row]
        }

        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        self.filteredRestaurant.removeAll(keepingCapacity: false)
        
        let searchText = searchController.searchBar.text?.lowercased()
        filteredRestaurant = restaurantProduct.filter({$0.lowercased().range(of: searchText!) != nil})
        
        if(filteredRestaurant == [])
        {
            filteredRestaurant = restaurantProduct
        }
        
        self.tableView.reloadData()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //Creates a view and links it to the PersonViewController
        let view = segue.destination as! FoodTableViewController
        //Grabs the index of the table cell clicked
        let index = tableView.indexPathForSelectedRow!.row
        //sends the view the person
        
        
        if( filteredRestaurant[index] == "Torchy's Tacos")
        {
            view.menu = ["Baja Shrimp", "Beef Taco", "Chicken Taco"]
        }
        else if( filteredRestaurant[index] == "Pluckers")
        {
            view.menu = ["Wings", "Mac & Cheese", "Boneless Chicken"]
        }
        else
        {
            view.menu = ["Padthai", "Egg Rolls", "Spring Rolls"]
        }
        
        view.store = filteredRestaurant[index]
    }
    

}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
}

