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
    func insert(key:String,value:V) throws
    func lookup(key:String) throws-> V?
    
}
