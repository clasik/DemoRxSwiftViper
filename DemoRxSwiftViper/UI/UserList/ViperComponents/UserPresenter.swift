//
//  UserPresenter.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

class UserPresenter: UserListViewPresenterInput{
    
    weak var userListView: UserListViewInput?
    var interactor: UserInteractorInput!
    var page: Int! = 0
    
    func resetPagination(){
        page = 0
        getUserList()
    }
    
    func getUserList() {
        interactor.getUserList(page: page)
        page += 1
    }
}

extension UserPresenter: UserInteractorOutput{
    
    func showLoadingUsersError(_ message: String) {
        userListView?.showLoadingUsersError(message)
    }
    
    func showUsers(for list: [User]){
        userListView?.showUsers(for: list)
    }
    
    func showLoadingUsers(){
        userListView?.showLoadingUsers()
    }
    
    func hideLoadingUsers(){
        userListView?.hideLoadingUsers()
    }
}
