//
//  Constants.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

enum Servers{
    public static let DEV = "https://api.randomuser.me/"
}

class Constants{
    public static let BASE_URL = Servers.DEV
}

enum APIPath: String{
    case users = "?results=40"//&page=2
    
    var path: String{
        return Constants.BASE_URL + rawValue
    }
}
