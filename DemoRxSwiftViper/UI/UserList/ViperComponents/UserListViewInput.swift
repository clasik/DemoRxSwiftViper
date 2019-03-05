//
//  UserListViewInput.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

protocol UserListViewInput: class {
    
    func showLoadingUsersError(_ message: String)
    
    func showLoadingUsers()
    
    func showUsers(for: [User])
    
    func hideLoadingUsers()
}

