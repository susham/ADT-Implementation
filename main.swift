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
var key: String="";
var x=String(key.hashValue)
print(x)

var value: (Int, Bool)
for i in 1..<500
{
    key="";
    for _ in 1...i
    {
        key+="aa"
    }
    if i % 2 == 0
    {
        value=(i,true)
    }
    else {
    value=(i,false)
    }
    dict.insert(key:key,value:value);
    
}

print("Inserting values completed")




for i in 1..<333
{
    key="";
    for _ in 1...i
    {
        key+="aaa"
    }

    var searchresult = dict.lookup(key:key);
    print("Value for key: ")
    print(searchresult as Any)
}






