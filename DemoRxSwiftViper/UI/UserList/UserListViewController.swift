//
//  UserListViewController.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UserListViewController: BaseViewController, TableViewDelegate {
    
    @IBOutlet weak var dataSource: UserTableViewDataSource!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let disposeBag = DisposeBag() // Bag of disposables to release them when view is being deallocated
    
    private var presenter: UserListViewPresenterInput!
    private var interactor: UserInteractorInput!
    private var userSelected: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        initializePresenter()
        hideKeyboardWhenTappedAround()
        refreshTable((Any).self);
    }
    
    
    private func initializePresenter(){
        presenter = UserPresenter()
        interactor = UserInteractor()
        interactor.output = presenter as? UserInteractorOutput
        presenter.userListView = self
        presenter.interactor = interactor
    }
    
    @IBAction func refreshTable(_ sender: Any) {
        presenter.resetPagination()
        self.dataSource.clearUserList()
        self.tableView.reloadData()
        hideKeyboard()
    }
    
    private func prepareTableView(){
        dataSource.tableViewDelegate = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.dataSource = dataSource
        self.tableView.delegate = dataSource
        
        searchBar
            .rx.text // Observable property thanks to RxCocoa
            .orEmpty // Make it non-optional
            .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
            .filter { !$0.isEmpty } // If the new value is really new, filter for non-empty query.
            .subscribe(onNext: { [unowned self] query in // Here we will be notified of every new value
                self.dataSource.filterByQuery(self.tableView, query: query)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - TableViewDelegate
    
    func selectedUser(user: User) {
        self.userSelected = user
        self.performSegue(withIdentifier: "userDetailSegue", sender: self)
    }
    
    func reloadData(){
        self.tableView.reloadData()
    }
    
    func loadMore(){
        presenter.getUserList()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "userDetailSegue" {
            if let destinationVC = segue.destination as? UserDetailViewController {
                destinationVC.user = self.userSelected;
            }
        }
    }
}

extension UserListViewController: UserListViewInput{
    
    func showLoadingUsersError(_ message: String) {
        showErrorMessage(message)
    }
    
    func showLoadingUsers(){
        showLoadingView(self.tableView)
    }
    
    func showUsers(for list: [User]){
        dataSource.setUserList(list)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func hideLoadingUsers(){
        hideLoadingView(self.tableView)
    }
}

extension UserListViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dataSource.filterByQuery(self.tableView, query: searchBar.text!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.dataSource.filterByQuery(self.tableView, query: searchBar.text!)
        hideKeyboard()
    }
}
