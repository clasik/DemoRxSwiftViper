//
//  Picture.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import ObjectMapper

public class Picture: Mappable{
    
    private var _large : String?
    private var _medium: String?
    private var _thumbnail : String?
    
    var large : String{
        return _large ?? ""
    }
    
    var medium : String{
        return _medium ?? ""
    }
    
    var thumbnail : String{
        return _thumbnail ?? ""
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _large <- map["large"]
        _medium <- map["medium"]
        _thumbnail  <- map["thumbnail"]
    }
    
}
