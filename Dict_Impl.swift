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
    typealias dict = [String : V]
    
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
    
    func empty() -> dict{
        return [:]
        
    }
    
    func insert(key:String,value:V){
        if(e == nil)
        {       //LinkedList is empty.
        self.e=Node(Key:key,value:value,next:nil);
        }
        else
        {
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
    }
    
    
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
    
}
