//
//  Identifier.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import ObjectMapper

public class Identifier: Mappable{
    
    private var _name : String?
    private var _value : String?
    
    var name : String{
        return _name ?? ""
    }
    
    var value : String{
        return _value ?? ""
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _name <- map["name"]
        _value <- map["value"]
    }
    
}
