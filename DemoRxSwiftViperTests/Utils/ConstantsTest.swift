//
//  ConstantsTest.swift
//  DemoRxSwiftViperTests
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import Quick
import Nimble

@testable import DemoRxSwiftViper

class ConstantsTests: QuickSpec {
    
    override func spec() {
        describe("test Constant initialization") {
            
            it("BASE URL must be initialized") {
                let baseURL = Constants.BASE_URL
                let actualBaseURL = "https://api.randomuser.me/"
                expect(baseURL).to(equal(actualBaseURL))
            }
            
            it("Users endPoint must must be initialized") {
                let actualUsersEndPoint = "https://api.randomuser.me/?results=40"
                let usersEndPoint = APIPath.users.path
                expect(usersEndPoint).to(equal(actualUsersEndPoint))
            }            
        }
    }
}
