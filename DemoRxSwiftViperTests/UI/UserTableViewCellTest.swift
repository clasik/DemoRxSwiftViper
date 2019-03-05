//
//  UserTableViewCellTest.swift
//  DemoRxSwiftViperTests
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import Quick
import Nimble

@testable import DemoRxSwiftViper

class UserTableViewCellTest: QuickSpec {
    
    override func spec() {
        var testTableViewDelegate: UserTableViewDataSource!
        var userResponse: UserResponse!
        var testCell: UserTableViewCell!
        var testUserListViewController: UserListViewController!
        
        beforeEach {
            testTableViewDelegate = UserTableViewDataSource()
            userResponse = UserServiceTest().getUserListServiceMock()
            testCell = UserTableViewCell(style: .default, reuseIdentifier: UserTableViewCell.ID)
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            testUserListViewController = storyboard.instantiateViewController(withIdentifier: "UserListViewController") as? UserListViewController
            
            testTableViewDelegate.setUserList(userResponse.usersList)
        }
        
        describe("UserTableViewCell initialization") {
            
            beforeEach {
                _ = testUserListViewController.view
                testUserListViewController.tableView.delegate = testTableViewDelegate
                testUserListViewController.tableView.dataSource = testTableViewDelegate
            }
            
            it("carTableView must not equal nil") {
                expect(testUserListViewController.tableView).notTo(beNil())
            }
            
            it("cell view must not equal nil") {
                let cell = getUserTableViewCell()
                expect(cell).notTo(beNil())
            }
            
            it("cell Title Label must not equal nil") {
                let cell = getUserTableViewCell()
                expect(cell.titleLabel).notTo(beNil())
            }
            
            it("cell Email Label must not equal nil") {
                let cell = getUserTableViewCell()
                expect(cell.emailLabel).notTo(beNil())
            }
            
            it("cell Phone Label must equal 968-273-141") {
                let cell = getUserTableViewCell()
                expect(cell.phoneLabel.text).to(equal("968-273-141"))
            }
            
            it("cell Photo must NOT equal nil") {
                let cell = getUserTableViewCell()
                expect(cell.photoView).notTo(beNil())
            }
        }
        
        func getUserTableViewCell() -> UserTableViewCell{
            let indexPath = IndexPath.init(row: 0, section: 0)
            let cell = testTableViewDelegate.tableView(testUserListViewController.tableView, cellForRowAt: indexPath) as! UserTableViewCell
            return cell
        }
    }
}
