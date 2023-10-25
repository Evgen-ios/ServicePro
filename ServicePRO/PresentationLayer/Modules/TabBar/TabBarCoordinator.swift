//
//  TabBarCoordinator.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import Foundation
import DITranquillity
import UIKit


class TabBarCoordinator: BaseCoordinator<TabBarViewController> {
    private var bag = CancelBag()
    private var window: UIWindow
    
    init(_ container: DIContainer, window: UIWindow) {
        self.window = window
        
        super.init(container)
        rootViewController = TabBarAssembly.createModule(container)
    }
    
    override func start() {
        setupMainController()
    }
    
    // MARK: Private
    private func setupMainController() {
        let items = rootViewController.createItems(container: container)
        let controllers = items.map { $0.controller }
        let cordinators = items.compactMap { $0.cordinator }
        
        rootViewController.viewControllers = controllers
                
        window.changeRootViewController(to: rootViewController)
        window.makeKeyAndVisible()
        cordinators.forEach {
            self.coordinate(to: $0)
        }
    }

}

