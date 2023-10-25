//
//  MapViewCell.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import YandexMapsMobile
import SnapKit

final class MapViewCell: LoadableCollectionViewCell {
    
    private lazy var mapView: YMKMapView = YBaseMapView().mapView
    
    // MARK: - Inherited Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func setup() {
        super.setup()
        setupViews()
    }
    
    func configure(_ model: MapModel?){
        guard let model else { return }
        setupMap(model: model)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        addSubview(mapView)
        layout()
    }
    
    private func setupMap(model: MapModel) {
        mapView.mapWindow.map.move(
                with: YMKCameraPosition(
                    target: YMKPoint(latitude: model.lat, longitude: model.long),
                    zoom: model.zoom,
                    azimuth: model.azimuth,
                    tilt: 0
                ),
                animation: YMKAnimation(type: .smooth, duration: 2),
                cameraCallback: nil)
        setupPlacemark(model: model)
    }
    
    private func setupPlacemark(model: MapModel) {
        model.placemark.forEach {
            let placemark = self.mapView.mapWindow.map.mapObjects.addPlacemark()
            placemark.geometry = YMKPoint(latitude: $0.lat, longitude: $0.long)
            placemark.setIconWith($0.icon)
            placemark.setTextWithText("\($0.lat), \($0.long)", style: {
                let textStyle = YMKTextStyle()
                textStyle.size = 8.0
                textStyle.placement = .top
                return textStyle
            }())
        }
    }
    
    private func layout() {
        mapView.snp.remakeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
