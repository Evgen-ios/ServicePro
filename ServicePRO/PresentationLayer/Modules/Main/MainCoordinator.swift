//
//  MainCoordinator.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import DITranquillity
import UIKit
import MintRouter

class MainCoordinator: BaseCoordinator<MainViewController>, BackRoute {
    
        init(type: EventViewType, container: DIContainer) {
            super.init(container)
            rootViewController = MainAssembly.createModule(container)
        }

    override func start() {}
    
}
