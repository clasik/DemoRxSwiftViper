//
//  CustomDate.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import ObjectMapper

public class CustomDate: Mappable{
    
    private var _date : String?
    
    var date : String{
        return _date ?? ""
    }
        
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _date <- map["date"]
    }
    
}
