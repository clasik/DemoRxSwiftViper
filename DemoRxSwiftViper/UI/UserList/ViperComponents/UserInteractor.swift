//
//  UserInteractor.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//


import RxCocoa
import RxSwift

class UserInteractor: UserInteractorInput{
    
    weak var output: UserInteractorOutput?
    private var userListService = UserListService()
    private var disposeBag = DisposeBag()
    
    /**
     * Call the network request to get all the placemarks
     */
    func getUserList(page: Int){
        output?.showLoadingUsers()
        
        userListService.getUserList(page: page).subscribe(onNext: { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.output?.hideLoadingUsers()
            
            strongSelf.output?.showUsers(for: response.usersList)
            
            }, onError: { [weak self] error in
                guard let strongSelf = self else { return }
                strongSelf.output?.hideLoadingUsers()
                strongSelf.output?.showLoadingUsersError("Error")
        }).disposed(by: disposeBag)
    }
}
