//
//  LoginViewController.swift
//  ChefSpecial
//
//  Created by Azaam Jamil on 3/19/17.
//  Copyright © 2017 bk8323. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var lblLabel: UILabel!
    
    var person: NSManagedObject!
    
    var users = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        lblLabel.text=""
        // Do any additional setup after loading the view.
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func verify() -> Bool
    {
        for i in 0..<users.count {
            let p1 = users[i]
            let user = (p1.value(forKey: "username") as? String)
            let pass = (p1.value(forKey: "password") as? String)
            if (user == txtLogin.text && pass == txtPass.text)
            {
                person = p1
                return true
            }
        }
        lblLabel.text = "Username and Password does not exist"
        return false
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
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                            sender: Any?) -> Bool{
        if(identifier=="login")
        {
            if(verify()){
                return true
            }
            else {
                lblLabel.text = "Username and/or password is incorrect"
                return false
            }
        }
        return true
    }


}
