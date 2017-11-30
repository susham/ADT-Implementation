
//
//  Client.swift
//  Assignment
//
//  Created by Group 8 on 11/27/17.
//  Copyright © 2017 Susham Kumar. All rights reserved.
//

//creating empty Dictionary object by providing the dictionary values Type and accumulator type
var dict = Dict<(Int,Bool)>()
var key: String="";
var value: (Int, Bool)

//Testing code for Dictionary Insert, for each i value 2i 'a's are generated as key and if the i value is even, then the dictionary value will be a tuple(i,true) else (i,false)
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

// Testing code for "Lookup" function, which searches for keys that are generated by the following condition:
// for every i,key generated will be 3i 'a'
for i in 1..<333
{
    key="";
    for _ in 1...i
    {
        key+="aaa"
    }
    let searchresult = dict.lookup(key:key);
    print("Value for searched key is:",searchresult as Any)

}



//higher order function to be passed as a parameter to the fold function, which calcualtes the number of values whose boolean value is true.
func counter(acc: Int,key:String,value:(Int,Bool)) -> (Int) {
    var count:Int=acc;
    if(value.1 == true){
        count=count+1;
        
    }
    return count;
}
var value_count=dict.fold(acc: 0,function:counter);
print("Nodes with bool value as true:",value_count)

