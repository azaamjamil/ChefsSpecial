//
//  Restaurant.swift
//  ChefSpecial
//
//  Created by Imran Khan on 3/19/17.
//  Copyright © 2017 bk8323. All rights reserved.
//

import Foundation

class Restaurant
{
    var name:String
    var type:String
    var address:String
    var menu : Array<String> = []


    init(name:String, type:String, address:String, menu: Array<String>)
    {
        self.name = name
        self.type = type
        self.address = type
        self.menu = menu
    }



}
