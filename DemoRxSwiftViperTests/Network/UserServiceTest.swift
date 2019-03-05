//
//  UserResponseTest.swift
//  DemoRxSwiftViperTests
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import ObjectMapper

@testable import DemoRxSwiftViper

class UserServiceTest{
    
    func getUserListServiceMock() -> UserResponse?{
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "users", ofType: "json")
        let pathUrl = "file://" + path!
        do {
            let jsonData = try Data(contentsOf: NSURL.init(string: pathUrl)! as URL, options: .alwaysMapped)
            guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) else {
                return nil
            }
            return  Mapper<UserResponse>().map(JSON: json as! [String : Any])
            
        }catch(let error){
            print (error.localizedDescription)
        }
        return nil
    }
}
