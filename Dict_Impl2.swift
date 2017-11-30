//
//  Dict_Impl2.swift
//  AbstractDataType
//
//  Created by Rakesh Palam on 11/28/17.
//  Copyright © 2017 Harita Palam. All rights reserved.
//

import Foundation
public class HashDict<T>: ADTDict {
    func fold(acc: Int, f: (Int, String, T) -> Int) -> Int {
          //not implemented
        return 0
    }
    
    typealias A = Int
    typealias V = T
    typealias dict = [String : V]
    
    private class HashNode {
    var key: String!
    var value: V!
    //var next: HashNode!
    }
    
   // class HashTable {
        private var buckets: Array<HashNode?>
        
        //initialize the buckets with nil values
        init(capacity: Int) {
            self.buckets = Array<HashNode!>(repeating:nil, count: capacity)
        }
        //compute the hash value to be used
        func createHash(_ Key: String) -> Int! {
            var remainder: Int = 0
            var divisor: Int = 0
            
            //obtain the ascii value of each character
            for c in Key.unicodeScalars {
                divisor += Int(c.value)
            }
            
            remainder = divisor % buckets.count
            return remainder
        }
    
    //add the value using a specified hash
    func insert(key: String, value: T)  {
        var hashindex: Int!
        
        //create a hashvalue using the key
        hashindex = self.createHash(key)
        //print("Hashindex is \(hashindex)")
        let dict: HashNode = HashNode()
        dict.key = key
        dict.value = value
        //print("dict is \(dict)")
        
        //check for an existing bucket
        if (buckets[hashindex] == nil) {
            buckets[hashindex] = dict
            print("Hashindex is \(hashindex)")
        }
        else {
            print("a collision occured for \(hashindex). implementing linear probing..")
            
            //update the chained list
            repeat{
                hashindex = hashindex + 1
            }while(buckets[hashindex] != nil)
            
            buckets[hashindex] = dict
            print("New hashindex is \(hashindex)")
        }
    }
    
    func empty() -> dict{
        return [:]
    }
    
    func lookup(key: String) -> T? {
        //not implemented
        var hashindex: Int!
        var bucketValue: T!
        
        //create a hashvalue using the key
        hashindex = self.createHash(key)
        print("Hashindex in lookup is \(hashindex)")
        
        let currbucket = self.buckets
        print(currbucket[hashindex]?.key as Any)
        
        
        if(currbucket[hashindex]?.key == key){
            bucketValue = currbucket[hashindex]?.value
        }
        else{
            
            hashindex = hashindex + 1
                /*guard hashindex < buckets.capacity  else{
                    throw Error
                }*/
                while(buckets[hashindex] != nil){
                if (currbucket[hashindex]?.key == key){
                    break
                }
                else{
                    hashindex = hashindex + 1
                    continue
                }
              
                }
           
                bucketValue = currbucket[hashindex+1]?.value
        
            /*catch (Error ){
                fatalError("Index out of range")
            }*/
        }
        return bucketValue
    }
    
}
