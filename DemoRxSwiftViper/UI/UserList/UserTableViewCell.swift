//
//  UserTableViewCell.swift
//  DemoRxSwiftViper
//
//  Created by Principal on 05/03/2019.
//  Copyright © 2019 Principal. All rights reserved.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    public static let ID = "UserTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateData(user: User){
        titleLabel.text = user.name.allInfoInOneLine
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        let downloadURL = URL(string: user.picture.thumbnail)!
        photoView.kf.setImage(with: downloadURL)
    }
}
