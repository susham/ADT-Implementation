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
    func empty()-> dict
    func insert(key:String,value:V)
    func lookup(key:String)-> V?
    
}
