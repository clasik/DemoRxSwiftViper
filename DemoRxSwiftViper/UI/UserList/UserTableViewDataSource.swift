//
//  UserTableViewDataSource.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import UIKit

enum TableViewDelegateMode {
    case search
    case result
}

class UserTableViewDataSource: NSObject, UITableViewDataSource , UITableViewDelegate{
    
    var tableViewDelegate: TableViewDelegate?
    
    private var userList = [User]()
    private var shownUserList = [User]()
    private var delegateMode: TableViewDelegateMode = .result
    
    func setUserList(_ userList: [User]){
        self.userList.append(contentsOf: userList)
        self.userList = self.userList.uniqued()
        self.shownUserList = self.userList
    }
    
    func clearUserList(){
        self.userList = [User]()
        self.shownUserList = self.userList
        self.delegateMode = .result
    }
    
    func toggleDelegateMode(mode: TableViewDelegateMode) {
        self.delegateMode = mode
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch delegateMode {
        case .search:
            return shownUserList.count
        case .result:
            return userList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.ID, for: indexPath)
            as? UserTableViewCell{
            
            var user: User
            switch delegateMode {
            case .search:
                user = shownUserList[indexPath.row]
            case .result:
                user = userList[indexPath.row]
            }
            cell.updateData(user: user)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var user: User
            switch delegateMode {
            case .search:
                user = shownUserList[indexPath.row]
            case .result:
                user = userList[indexPath.row]
            }
            
            if let index = shownUserList.index(of: user) {
                shownUserList.remove(at: index)
            }
            if let index = userList.index(of: user) {
                userList.remove(at: index)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        var user: User
        switch delegateMode {
        case .search:
            user = shownUserList[indexPath.row]
        case .result:
            user = userList[indexPath.row]
        }
        self.tableViewDelegate!.selectedUser(user: user)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if delegateMode == .search {
            return
        }
        
        if indexPath.row == userList.count - 1 {
            self.tableViewDelegate!.loadMore()
        }
        
    }
    
    func filterByQuery(_ tableView: UITableView, query: String){
        self.delegateMode = .search
        shownUserList = userList.filter { $0.name.allInfoInOneLine.lowercased().contains(query.lowercased()) ||
            $0.email.lowercased().contains(query.lowercased())}
        self.tableViewDelegate!.reloadData() // And reload table view data.
    }
}

protocol TableViewDelegate {
    func selectedUser(user: User)
    func reloadData()
    func loadMore()
}
