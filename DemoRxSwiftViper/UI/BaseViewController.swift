//
//  BaseViewController.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = UIColor.blue
        activityIndicatorView.sizeToFit()
        return activityIndicatorView
    }()
    
    public func showErrorMessage(_ message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertViewController.addAction(UIAlertAction.init(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertViewController, animated: true, completion: nil)
        hideKeyboard()
    }
    
    func showLoadingView(_ tableView: UITableView){
        tableView.sectionFooterHeight = 60
        tableView.tableFooterView = activityIndicatorView
        activityIndicatorView.startAnimating()
        hideKeyboard()
    }
    
    func hideLoadingView(_ tableView: UITableView){
        if activityIndicatorView.isDescendant(of: tableView) {
            activityIndicatorView.stopAnimating()
            activityIndicatorView.removeFromSuperview()
            tableView.tableFooterView = nil
            hideKeyboard()
        }
    }
}

extension UIScrollView {
    func  isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
        navigationController?.navigationBar.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
