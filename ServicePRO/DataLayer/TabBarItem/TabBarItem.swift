//
//  TabBarItem.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import Foundation
import UIKit
import DITranquillity

enum EventViewType {
    case main
}
enum TabBarControllersType {
    case main, list, add, car, map
    static func ==(lhs: TabBarControllersType, rhs: TabBarControllersType) -> Bool {
        switch lhs {
        case .main:
            if case TabBarControllersType.main = rhs {
                return true
            }
        case .list:
            if case TabBarControllersType.list = rhs {
                return true
            }
        case .add:
            if case TabBarControllersType.add = rhs {
                return true
            }
        case .car:
            if case TabBarControllersType.car = rhs {
                return true
            }
        case .map:
            if case TabBarControllersType.map = rhs {
                return true
            }
        }
        return false
    }
    
    var icon: UIImage {
        switch self {
        case .main:
            return UIImage(named: "home")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        case .list:
            return UIImage(named: "list")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        case .add:
            return UIImage(named: "plus")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        case .car:
            return UIImage(named: "car")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        case .map:
            return UIImage(named: "map")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        }
    }
    
    func fetchCoordinator(_ container: DIContainer) -> Coordinator? {
        switch self {
        case .main:
            return MainCoordinator(type: .main, container: container)
        case .list:
            return MainCoordinator(type: .main, container: container)
        case .add:
            return MainCoordinator(type: .main, container: container)
        case .car:
            return MainCoordinator(type: .main, container: container)
        case .map:
            return MainCoordinator(type: .main, container: container)
        }
    }
    
    func fetchController(_ coordinator: Coordinator?) -> UIViewController {
        switch self {
        case .main:
            if let coordinator = coordinator as? MainCoordinator {
                return coordinator.rootViewController
            }
        default: break
            
        }

        return UIViewController()
    }
}

struct TabBarItem {
    var type: TabBarControllersType
    var controller: UIViewController
    var cordinator: Coordinator?
    var withNavBar: Bool
    private (set)var tabBarItem: UITabBarItem?
    
    init(type: TabBarControllersType,
         container: DIContainer,
         withNavBar: Bool = false,
         title: String) {
        self.type = type
        self.withNavBar = withNavBar
        self.cordinator = type.fetchCoordinator(container)
        self.controller = withNavBar ? SwipeNavigationController(rootViewController: type.fetchController(cordinator)) : type.fetchController(cordinator)
        controller.apply
        {
            self.tabBarItem = $0.tabBarItem
            $0.tabBarItem.image = type.icon
            $0.tabBarItem.title = title
        }
    }
}


