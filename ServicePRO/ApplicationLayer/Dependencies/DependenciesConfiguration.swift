//
//  DependenciesConfiguration.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 23.10.2023.
//

import DITranquillity
import UIKit
import MintLogger

public protocol DependenciesConfiguration {
    func setup()
    func configuredContainer() -> DIContainer
}

open class DependenciesConfigurationBase: DependenciesConfiguration, Loggable {
    private var options: [UIApplication.LaunchOptionsKey: Any]?
    
    init(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.options = launchOptions
    }
    
    // MARK: - Configure
    public func configuredContainer() -> DIContainer {
        let container = DIContainer()
        container.append(framework: AppFramework.self)
        return container
    }
    
    // MARK: - Setup
    public func setup() {}
}
