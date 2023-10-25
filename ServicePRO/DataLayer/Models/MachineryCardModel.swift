//
//  MachineryCardModel.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit

struct MachineryCardModel {
    var id: Int
    var name: String
    var time: String
    var vendor: String
    var logo: UIImage
    
    init(id: Int, name: String, time: String, vendor: String, logo: UIImage) {
        self.id = id
        self.name = name
        self.time = time
        self.vendor = vendor
        self.logo = logo
    }
}
