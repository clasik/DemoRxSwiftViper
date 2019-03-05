//
//  UserDetailViewController.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import UIKit
import Kingfisher


class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var genereLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var registerDateLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData(user: user!)        
    }
    
    func updateData(user: User){
        genereLabel.text = user.gender
        titleLabel.text = user.name.allInfoInOneLine
        locationLabel.text = user.location.allInfoInOneLine
        registerDateLabel.text = user.registered.date
        emailLabel.text = user.email
        
        let downloadURL = URL(string: user.picture.large)!
        photoView.kf.setImage(with: downloadURL)
    }
    
}
