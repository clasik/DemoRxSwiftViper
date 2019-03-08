//
//  UserListContract.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 08/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import UIKit

protocol UserListWireframe: class {
    var viewController: UIViewController? { get set }
    
    func presentDetails(for user: User)    
}
