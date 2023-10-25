//
//  Placemark.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 25.10.2023.
//

import UIKit

struct Placemark {
    var lat: Double
    var long: Double
    var icon: UIImage
    
    init(lat: Double, long: Double, icon: UIImage) {
        self.lat = lat
        self.long = long
        self.icon = icon
    }
}
