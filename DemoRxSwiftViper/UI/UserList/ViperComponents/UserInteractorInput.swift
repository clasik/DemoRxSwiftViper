//
//  UserInteractorInput.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

protocol UserInteractorInput: class {
    
    var output: UserInteractorOutput? { get set }
    
    func getUserList(page: Int)
}
