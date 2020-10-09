//
//  PostTVC.swift
//  VIPERSimpleAppCodeBased
//
//  Created by Mostafa Abd ElFatah on 10/9/20.
//  Copyright © 2020 MostafaAbdElFatah. All rights reserved.
//

import UIKit

class PostTVC: UITableViewCell, PostCellViewProtocol {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postText: UILabel!
    
    func configure(display: DisplayedPost) {
        selectionStyle = .none
        userName.text = display.name
        postDate.text = display.date
        postText.text = display.post
    }
}

