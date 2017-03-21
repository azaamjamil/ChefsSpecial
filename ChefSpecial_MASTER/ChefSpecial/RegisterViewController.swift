//
//  RegisterViewController.swift
//  ChefSpecial
//
//  Created by Azaam Jamil on 3/20/17.
//  Copyright © 2017 bk8323. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var lblUser: UILabel!
    
    // Core Data object
    // Holds instances of NSManagedObject rather than our Person class objects
    var users = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        lblUser.text = ""
        // Do any additional setup after loading the view.
        
        loadData()
    }
    
    //Load Data method
    fileprivate func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            //populates the array
            users = results
        } else {
            print("Could not fetch")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Save Person Method
    func save(Name: String, UserName: String, Email: String, City: String, Password: String)
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        
        //creates a Candidate entity that will save in the core data
        let p1 = NSManagedObject(entity: entity!, insertInto:managedContext)
        
        // Set the attribute values
        p1.setValue(Name, forKey: "name")
        p1.setValue(UserName, forKey: "username")
        p1.setValue(Password, forKey: "password")
        p1.setValue(Email, forKey: "email")
        p1.setValue(City, forKey: "city")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        users.append(p1)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool{
        //If username already exists
        for i in 0..<users.count{
            let p1 = users[i]
            let user = (p1.value(forKey: "username") as? String)
            if (txtUser.text==user)
            {
                lblUser.text="This Username is already taken"
                return false
            }
        }
        //If it is empty, tell the user to enter all the fields
        if (txtUser.text == "" || txtPass.text == "" || txtEmail.text=="" || txtCity.text=="" || txtName.text=="")
        {
            lblUser.text="You must enter a value for all fields."
            return false
        }
        else
        {
            //grabs the values for all the inputs
            let user = txtUser.text
            let pass = txtPass.text
            let email = txtEmail.text
            let city = txtEmail.text
            let name = txtName.text            //calls the save function
            save(Name: name!, UserName: user!, Email: email!, City: city!, Password: pass!)
            //changes the label names
            lblUser.text = "Candidate Saved!"
            return true
        }
    }

}


