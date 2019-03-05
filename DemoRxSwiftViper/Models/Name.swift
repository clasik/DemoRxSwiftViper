//
//  Name.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import ObjectMapper

public class Name: Mappable{
        
    private var _title : String?
    private var _first: String?
    private var _last : String?
    
    var allInfoInOneLine: String{
        var text = title
        text += " "
        text += first
        text += " "
        text += last
        return text
    }
    
    var title : String{
        return _title ?? ""
    }
    
    var first : String{
        return _first ?? ""
    }
    
    var last : String{
        return _last ?? ""
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _title <- map["title"]
        _first <- map["first"]
        _last  <- map["last"]
    }
    
}
