//
//  IDict.swift
//  Assignment
//
//  Created by Susham Kumar on 11/27/17.
//  Copyright © 2017 Susham Kumar. All rights reserved.
//

import Foundation
protocol ADTDict {
    associatedtype V
    associatedtype dict
    associatedtype A
    func empty() -> Self
    func insert(key:String,value:V) 
    func lookup(key:String) throws -> V?
    func fold(acc:A,f: (A,String,V) -> A) -> A
}

