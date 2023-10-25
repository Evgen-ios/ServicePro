//
//  UserModel.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit

struct UserModel {
    var id: Int
    var name: String
    var avatar: UIImage
    
    init(id: Int, name: String, avatar: UIImage) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
}
