//
//  Client.swift
//  Assignment
//
//  Created by Susham Kumar on 11/27/17.
//  Copyright © 2017 Susham Kumar. All rights reserved.
//

import Foundation


var dict = Dict<(Int,Bool)>() //creating empty Dictionary object
//print(dictionary)
var key:String="abc";
//test to insert values to the linked list.
dict.insert(key:"abc",value:(1,false));
dict.insert(key:"abcd",value:(2,true));
dict.insert(key:"abcde",value:(3,false));
print("Inserting values completed")
var searchresult=dict.lookup(key: "abcdef")
print(searchresult as Any)




