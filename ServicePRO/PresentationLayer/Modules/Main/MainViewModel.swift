//
//  MainViewModel.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import DITranquillity
import Combine

final class MainViewModel {
    
    // MARK: - Properties
    private var bag = CancelBag()
    
    let input = Input()
    let output = Output()
    
    // MARK: - Init
    init() {
        self.setUpBindings()
    }
    
    // MARK: - SetUp Bindings
    private func setUpBindings() {
        input.didLoad.publisher
            .sink(receiveValue: { [weak self] _ in
                self?.configureMapModel()
                self?.configureMachineryCardModel()
                self?.configureImages()
            })
            .store(in: &bag)
    }
    
    private func configureMapModel() {
        guard let pinImage = UIImage(named: "pin") else { return }
        let model = MapModel(lat: 59.935493, long: 30.327392, zoom: 11, azimuth: 0, placemark: [
            Placemark(lat: 59.915493, long: 30.325392, icon: pinImage),
            Placemark(lat: 59.985493, long: 30.323392, icon: pinImage),
            Placemark(lat: 59.965493, long: 30.321392, icon: pinImage),
            Placemark(lat: 59.995493, long: 30.328392, icon: pinImage),
            Placemark(lat: 59.935493, long: 30.329392, icon: pinImage)])
        output.mapModel.send(model)
    }
    
    private func configureMachineryCardModel() {
        guard let car = UIImage(named: "car") else { return }
        let name = "Трактор"
        let vendor = "АгроТехник"
        let time = "15: 00  05.06"
        var array: [MachineryCardModel] = []
        for i in 1...10 {
            let model = MachineryCardModel(id: i, name: name, time: time, vendor: vendor, logo: car)
            array.append(model)
        }
        
        output.items = array
    }
    
    private func configureImages() {
        var array: [UIImage] = []
        for i in 1...7 {
            let image = UIImage(named: String(i)) ?? UIImage()
            array.append(image)
        }
        
        output.images = array
    }
}


extension MainViewModel {
    final class Input {
        var didLoad: PublishedAction<Void> = .init()
    }
    
    final class Output {
        var mapModel: PublishedAction<MapModel> = .init()
        @PublishedProperty var items: [MachineryCardModel] = .init()
        @PublishedProperty var images: [UIImage] = .init()
    }
}
