//
//  MapModel.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 25.10.2023.
//

import Foundation

struct MapModel {
    var lat: Double
    var long: Double
    var zoom: Float
    var azimuth: Float
    var placemark: [Placemark]
    
    init(lat: Double, long: Double, zoom: Float, azimuth: Float, placemark: [Placemark]) {
        self.lat = lat
        self.long = long
        self.zoom = zoom
        self.azimuth = azimuth
        self.placemark = placemark
    }
}
