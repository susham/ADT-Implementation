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
    }
    
        private var hashTable: Array<HashNode?>
        
        //initialize the hashTable with nil values
        init(capacity: Int) {
            self.hashTable = Array<HashNode!>(repeating:nil, count: capacity)
        }
        //compute the hash value to be used
        func createHash(_ Key: String) -> Int! {
            var remainder: Int = 0
            var divisor: Int = 0
            
            //obtain the ascii value of each character
            for c in Key.unicodeScalars {
                divisor += Int(c.value)
            }
            
            remainder = divisor % hashTable.count
            return remainder
        }
    
    //add the value using a specified hash
    func insert(key: String, value: T)  {
        var hashindex: Int!
        
        //create a hashvalue using the key
        hashindex = self.createHash(key)
        
        let dict: HashNode = HashNode()
        dict.key = key
        dict.value = value
        
        //check for an existing bucket
        
        if (self.hashTable[hashindex] == nil) {
            self.hashTable[hashindex] = dict
            print("Hashindex is \(hashindex)")
        }
        else {
            print("a collision occured for \(hashindex). implementing linear probing..")
            if(self.hashTable[hashindex]?.key == key){
                print("key exists in hashtable \(self.hashTable[hashindex]?.key)")
                self.hashTable[hashindex]?.value = value
            }
            else{
                //update the chained list
                repeat{
                    hashindex = hashindex + 1
                    if hashindex >= self.hashTable.count {
                        fatalError("Hash table is full")
                        
                        //func abort();
                    }
                }while(self.hashTable[hashindex] != nil)
                
                self.hashTable[hashindex] = dict
                print("New hashindex is \(hashindex)")
            }
        }
    }
    
    func empty() -> dict{
        return [:]
    }
    
    func lookup(key: String) throws -> T? {
        var hashindex: Int!
        var hashTableValue: T!
        
        //create a hashvalue using the key
        hashindex = self.createHash(key)
        //print("Hashindex in lookup is \(hashindex)")
        
        let currHashTable = self.hashTable
        //print(currHashTable[hashindex]?.key as Any)
        
        
        if(currHashTable[hashindex]?.key == key){
            hashTableValue = currHashTable[hashindex]?.value
        }
        else{
            
            hashindex = hashindex + 1
                if hashindex >= self.hashTable.count {
                    throw NSError(domain: "", code: 0, userInfo: [NSLocalizedFailureErrorKey : "Array index out of bounds"])
                }
                else{
                    while(self.hashTable[hashindex] != nil){
                    if (currHashTable[hashindex]?.key == key){
                        break
                    }
                    else{
                        hashindex = hashindex + 1
                        continue
                    }
                  
                    }
                    //print("Hashindex in lookup is \(hashindex)")
                    hashTableValue = currHashTable[hashindex]?.value
            }
        }
        return hashTableValue
    }
    
}
