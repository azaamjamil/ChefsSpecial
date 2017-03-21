import Foundation

//Creates a class called
class Users {
    
    //creates private variables for candidate
    fileprivate var _name:String = ""
    fileprivate var _username:String = ""
    fileprivate var _password:String = ""
    fileprivate var _city: String = ""
    fileprivate var _email:String = ""
    
    //creates get and set for each private variable
    var name:String
        {
        get
        {
            return _name
        }
        set (new)
        {
            _name = new
        }
    }
    
    var username:String
        {
        get
        {
            return _username
        }
        set (new)
        {
            _username = new
        }
    }
    
    var city:String
        {
        get {
            return _city
        }
        set (new) {
            _city = new
        }
    }
    
    var email:String
        {
        get {
            return _email
        }
        set (new) {
            _email = new
        }
    }
    
    var password:String
        {
        get
        {
            return _password
        }
        set (new)
        {
            _password = new
        }
    }
    
    //defines an init method with every single input to allow for quick creation
    init(name:String, username:String, city:String, pass: String, email:String)
    {
        self.name = name
        self.username = username
        self.city = city
        self.email = email
        self.password = pass
    }
    
}

