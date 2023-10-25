//
//  MainAppCoordinator.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 23.10.2023.
//

import DITranquillity
import UIKit
import MintLogger
import YandexMapsMobile
import CoreLocation
import CoreTelephony

open class MainAppCoordinator: Loggable {
    
    public var defaultLoggingTag: LogTag {
        return .unnamed
    }
    
    private var bag: CancelBag = .init()
    
    public static var shared: MainAppCoordinator!

    open var configuration: DependenciesConfiguration
    open var container: DIContainer

    private let appCoordinator: AppCoordinator
    
    init(configuration: DependenciesConfiguration) {
        self.configuration = configuration
        self.configuration.setup()
        self.container = self.configuration.configuredContainer()
        self.appCoordinator = AppCoordinator(container)
    }

    func start() {
        setupYandexMapsApiKey()
        appCoordinator.start()
    }
    
    // MARK: - Setup
    private func setupYandexMapsApiKey() {
        YMKMapKit.setApiKey("2d17ac80-160e-4e51-9f1f-3b25e9454211")
        YMKMapKit.setLocale("ru_RU")
        YMKMapKit.sharedInstance()
    }
}

