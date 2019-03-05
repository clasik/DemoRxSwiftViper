//
//  Location.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import ObjectMapper

public class Location: Mappable{
    
    private var _street : String?
    private var _city: String?
    private var _state : String?
    
    var allInfoInOneLine: String{
        var text = street
        text += ", "
        text += city
        text += ", "
        text += state
        return text
    }
    
    var street : String{
        return _street ?? ""
    }
    
    var city : String{
        return _city ?? ""
    }
    
    var state : String{
        return _state ?? ""
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _street <- map["street"]
        _city <- map["city"]
        _state  <- map["state"]
    }
    
}
