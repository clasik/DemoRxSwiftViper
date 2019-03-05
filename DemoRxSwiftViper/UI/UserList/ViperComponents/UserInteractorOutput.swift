//
//  UserInteractorOutput.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//


protocol UserInteractorOutput: class {
    
    func showLoadingUsers()
    
    func hideLoadingUsers()
    
    func showUsers(for: [User])
    
    func showLoadingUsersError(_ message: String)
}
