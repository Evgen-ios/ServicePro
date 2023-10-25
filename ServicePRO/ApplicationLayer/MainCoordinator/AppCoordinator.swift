//
//  AppCoordinator.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 23.10.2023.
//

import DITranquillity
import UIKit

class AppCoordinator: BaseCoordinator<UINavigationController> {
    
    private var window: UIWindow!
    private var bag: CancelBag = .init()
    
    override init(_ container: DIContainer) {
        super.init(container)
    }
    
    override func start() {
        let coordinator = TabBarCoordinator(container, window: createWindow())
        self.coordinate(to: coordinator)
    }
    
    private func createWindow() -> UIWindow {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.backgroundColor = .black
        return self.window
    }
}
