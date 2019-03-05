//
//  User.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import ObjectMapper

public class User: Mappable{
    
    private var _identifier : Identifier?
    private var _name : Name?
    private var _email : String?
    private var _picture : Picture?
    private var _phone : String?
    private var _gender : String?
    private var _registered : CustomDate?
    private var _location : Location?
    
    
    var allInfoInOneLine: String{
        var text = name.title
        text += " "
        text += name.first
        text += ", "
        text += email
        text += ", "
        text += phone
        return text
    }
    
    var identifier : Identifier{
        return _identifier!
    }
    
    var name : Name{
        return _name!
    }
    
    var email : String {
        return _email ?? ""
    }
    
    var picture : Picture{
        return _picture!
    }
    
    var phone : String{
        return _phone ?? ""
    }
    
    var gender : String{
        return _gender ?? ""
    }
    
    var registered : CustomDate{
        return _registered!
    }
    
    var location : Location{
        return _location!
    }
    
    required public init?(map: Map){}
    
    public func mapping(map: Map){
        _identifier <- map["id"]
        _name     <- map["name"]
        _email    <- map["email"]
        _picture  <- map["picture"]
        _phone    <- map["phone"]
        _gender   <- map["gender"]
        _registered <- map["registered"]
        _location <- map["location"]
    }
    
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return  lhs.identifier.name == rhs.identifier.name &&
            lhs.identifier.value == rhs.identifier.value
    }
}

extension User: Hashable {
    public var hashValue: Int {
        return identifier.name.hashValue ^ identifier.value.hashValue
    }
}

