//
//  UserResponse.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import ObjectMapper

public class UserResponse: Mappable{
    
    private var _usersList : [User]?
    
    var usersList : [User]{
        return _usersList ?? []
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _usersList <- map["results"]
    }
}
