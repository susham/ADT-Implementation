//
//  Dict_Impl2.swift
//  Assignment
//
//  Created by Group 8(Susham,Haritha,Rohan) on 11/28/17.
//  Copyright © 2017 Group 8(Susham,Haritha,Rohan). All rights reserved.
//

import Foundation
enum HashTableError: Error{
    case hashTableFull
    case ArrayIndexOutOfBounds
}

public class HashDict<T>: ADTDict {
    typealias V = T

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
    
    //insert the value using a specified hash
    func insert(key: String, value: T) throws {
        var hashindex: Int!
        
        //create a hashvalue using the key
        hashindex = self.createHash(key)
        
        let ADTdict: HashNode = HashNode()
        ADTdict.key = key
        ADTdict.value = value
        
        //check for an existing entry
        
        if (self.hashTable[hashindex] == nil) {
            self.hashTable[hashindex] = ADTdict
        }
        else {
            //a collision occured...implementing linear probing!!!
           
            //update the hashtable
            if(self.hashTable[hashindex]?.key == key){
                self.hashTable[hashindex]?.value = value
            }
            else{
               
                repeat{
                    hashindex = hashindex + 1
                    if hashindex > (hashTable.count-1) {
                        throw HashTableError.hashTableFull
                    }
                }while(self.hashTable[hashindex] != nil)
                
                self.hashTable[hashindex] = ADTdict
            }
        }
    }
    
    func lookup(key: String) throws -> T? {
        var hashindex: Int!
        var hashTableValue: T!
        
        //create a hashvalue using the key
        hashindex = self.createHash(key)
        
        let currHashTable = self.hashTable
        if(currHashTable[hashindex]?.key == key){
            hashTableValue = currHashTable[hashindex]?.value
        }
        else{
            hashindex = hashindex + 1
                if hashindex > (self.hashTable.count-1) {
                    throw HashTableError.ArrayIndexOutOfBounds
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
                hashTableValue = currHashTable[hashindex]?.value
            }
        }
        return hashTableValue
    }
    
    func fold<A>(acc: A,function: (A, String, T) -> (A)) -> A{
        var p=acc;
        let currHashTable = self.hashTable;
        for hashEntry in currHashTable
        {
            if(hashEntry?.key != nil)
            {
                p=function(p,(hashEntry?.key)!,(hashEntry?.value)!);
            }
        }
        return p;
    }
    
}
