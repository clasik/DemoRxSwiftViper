//
//  UserResponseTest.swift
//  DemoRxSwiftViperTests
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import Quick
import Nimble

@testable import DemoRxSwiftViper

class UserResponseTest: QuickSpec {

    override func spec() {
        
        describe("UserResponse Initialization") {
            
            var testResponse: UserResponse!
            
            beforeEach {
                testResponse = UserServiceTest().getUserListServiceMock()
            }
            
            it("userList must not be empty") {
                let userListCount = testResponse.usersList.count
                expect(userListCount).notTo(equal(0))
            }
            
            it("userList initialization") {
                let user = testResponse.usersList[0]
                expect(user).notTo(beNil())
            }
            
            it("user name not equal nil") {
                let name = testResponse.usersList[0].name
                expect(name).notTo(beNil())
            }
            
            it("user name equal value") {
                let name = testResponse.usersList[0].name.allInfoInOneLine
                expect(name).to(equal("mrs jesus pascual"))
            }
            
            it("user identifier equal value") {
                let identifier = testResponse.usersList[0].identifier
                expect(identifier).notTo(beNil())
            }
            
            it("user identifier equal value") {
                let identifier = testResponse.usersList[0].identifier.value
                expect(identifier).to(equal("68705898-K"))
            }
            
            it("user email equal value") {
                let email = testResponse.usersList[0].email
                expect(email).notTo(beNil())
            }
            
            it("user email equal value") {
                let email = testResponse.usersList[0].email
                expect(email).to(equal("jesus.pascual@example.com"))
            }
            
            it("user picture equal value") {
                let picture = testResponse.usersList[0].picture
                expect(picture).notTo(beNil())
            }
            
            it("user picture equal value") {
                let picture = testResponse.usersList[0].picture.thumbnail
                expect(picture).to(equal("https://randomuser.me/api/portraits/thumb/women/42.jpg"))
            }
            
            it("user phone equal value") {
                let phone = testResponse.usersList[0].phone
                expect(phone).notTo(beNil())
            }
            
            it("user phone equal value") {
                let phone = testResponse.usersList[0].phone
                expect(phone).to(equal("968-273-141"))
            }
            
            it("user gender equal value") {
                let gender = testResponse.usersList[0].gender
                expect(gender).notTo(beNil())
            }
            
            it("user gender equal value") {
                let gender = testResponse.usersList[0].gender
                expect(gender).to(equal("female"))
            }
            
            it("user registered equal value") {
                let registered = testResponse.usersList[0].registered
                expect(registered).notTo(beNil())
            }
            
            it("user registered equal value") {
                let registered = testResponse.usersList[0].registered.date
                expect(registered).to(equal("2014-12-21T11:37:50Z"))
            }
            
            it("user location equal value") {
                let location = testResponse.usersList[0].location
                expect(location).notTo(beNil())
            }
            
            it("user location equal value") {
                let location = testResponse.usersList[0].location.allInfoInOneLine
                expect(location).to(equal("9986 avenida del planetario, albacete, galicia"))
            }
        }
    }
}
