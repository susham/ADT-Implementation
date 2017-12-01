//
//  Dict_Impl.swift
//  Assignment
//
//  Created by Susham Kumar on 11/27/17.
//  Copyright © 2017 Susham Kumar. All rights reserved.
//

import Foundation
public class Dict<T>: ADTDict {
    typealias V = T
    
    private class Node {
        var key:String;
        var value:V;
        var next:Node?; // terminate with null
        init(Key:String,value:V,next:Node?) {
            self.key=Key;
            self.value = value
            self.next = next
        }
    }
    private var e:Node?;
    
    public init() {
    self.e = nil;
    }
    
    //This function inserts the key,value into the dictionary and allows only a unique keys in the dictionary
    //if a key already exists then its value is updated in the dictionary.
    func insert(key:String,value:V){
        
        if(e == nil) //LinkedList is empty.
        {
            self.e=Node(Key:key,value:value,next:nil);
        }
        else
        {
            if(lookup(key: key) == nil){
                //key doesn't exist in the LinkedList
                if(self.e?.next == nil)
                {
                    self.e?.next=Node(Key:key,value:value,next:nil);
                }
                else
                {
                    var current=self.e;
                    while(current != nil)
                    {
                        if(current?.next == nil)
                        {
                            current?.next=Node(Key:key,value:value,next:nil);
                            current=current?.next?.next
                            
                        }
                        else
                        {
                            current=current?.next
                        }
                    }
                }
            }
            else{
                //dictionary has a key exists, update the value
                var current=e;
                while(current != nil)
                {
                    if(current?.key == key)
                    {
                        current?.value=value;
                        print("updated value");
                        break;
                    }
                    current=current?.next
                }
            }
        }
    }
    
    
    //Searches the dictionary for the key provided and returns its value.
    func lookup(key: String) -> T? {
        var current=e;
        while(current != nil)
        {
            if(current?.key == key)
            {
                return current?.value
            }
            else
            {
                current=current?.next
            }
        }
        return nil
    }
    
    //This function takes the initial value as the accumulator and the closure function provided by the client.
    //function is applied on each dictionary value and update the accumulator and then updated accumulator value is
    //used for next iteration. At the end, accumulator value is sent to the client.
    func fold<A>(acc: A,function: (A, String, T) -> (A)) -> A{
        var p=acc;
        var current=e;
        while(current != nil)
        {
            p=function(p,(current?.key)!,(current?.value)!);
            current=current?.next
        }
        return p;
    }
    
    
}
