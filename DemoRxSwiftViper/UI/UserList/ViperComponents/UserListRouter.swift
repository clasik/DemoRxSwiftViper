//
//  UserListRouter.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 08/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import UIKit

class UserListRouter: UserListWireframe {
    
    var viewController: UIViewController?
    
    func presentDetails(for user: User) {
        let userDetailViewController : UserDetailViewController = viewController?.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
            userDetailViewController.user = user;
        viewController?.navigationController?.pushViewController(userDetailViewController, animated: true)
    }
}
