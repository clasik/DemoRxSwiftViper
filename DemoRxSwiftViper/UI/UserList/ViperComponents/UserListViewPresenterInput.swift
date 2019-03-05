//
//  UserListViewInput.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

protocol UserListViewPresenterInput: class {
    
    var interactor: UserInteractorInput! { get set }
    
    var userListView: UserListViewInput? { get set }
    
    func resetPagination()
    
    func getUserList()
    
}

