//
//  UserListService.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import ObjectMapper
import AlamofireObjectMapper

/**
 *
 * Base class for the alamofire network request
 * it contains two function one for get the response josn as array and
 * the other function for get the response as an Object
 *
 */
class BaseMappableNetworkRequest<T: Mappable>: BaseNetworkRequest{
        
    public override init() {
        super.init()
    }
    
    public func getResponseArray(url: String) -> Observable<[T]>{
        let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(getMethodType(),
                                                   url!,
                                                   parameters: getParameters(),
                                                   headers: getHeaders())
        
        let observable = alamofireRequest.flatMap{
            $0.rx_responseArray(type: T.self)
        }
        return observable
    }
    
    public func getResponseObject(url: String, params: Parameters) -> Observable<T>{
        let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(getMethodType(),
                                                   url!,
                                                   parameters: params,
                                                   encoding: getEncoding(),
                                                   headers: getHeaders())
        
        let observable = alamofireRequest.flatMap{
            $0.rx_responseObject(type: T.self)
        }
        return observable
    }
}
