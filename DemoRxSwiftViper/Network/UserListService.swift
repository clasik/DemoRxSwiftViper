//
//  UserListService.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import RxSwift
import Alamofire

class UserListService: BaseMappableNetworkRequest<UserResponse>{
    
    func getUserList(page: Int) -> Observable<UserResponse>{
        let parameters: Parameters = [
            "page": page
        ]
        return getResponseObject(url: APIPath.users.path, params: parameters)
    }
}
