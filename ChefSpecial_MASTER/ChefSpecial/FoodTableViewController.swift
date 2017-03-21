//
//  FoodTableViewController.swift
//  ChefSpecial
//
//  Created by Bawee K on 3/20/17.
//  Copyright © 2017 bk8323. All rights reserved.
//

import UIKit

class FoodTableViewController: ViewController {

    var menu : Array<String> = []
    var store: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Changes the title
        self.title = "Restaurant List"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //Only need 1 section
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //Only runs the create Data Model once
        //returns the length of the length (10)
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        // Configures the cell with the first and last  name of the person
        cell.textLabel?.text="\(menu[indexPath.row])"
        
        //returns cell
        return cell
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
