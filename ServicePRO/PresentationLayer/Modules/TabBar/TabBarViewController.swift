//
//  TabBarViewController.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import DITranquillity
import MintRouter

final class TabBarViewController: UITabBarController {
    
    // MARK: - Properties
    var viewModel: TabBarViewModel!
    
    private var tabBarTag: Bool = true
    var items: [TabBarItem] = []
    
    // MARK: - Inherited Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Setup
    func createItems(container: DIContainer) -> [TabBarItem] {
        items = [
            TabBarItem(type: .main, container: container, withNavBar: false, title: Constants.TabBar.main),
            TabBarItem(type: .list, container: container, withNavBar: false, title: Constants.TabBar.list),
            TabBarItem(type: .add, container: container, withNavBar: false, title: Constants.TabBar.add),
            TabBarItem(type: .car, container: container, withNavBar: false, title: Constants.TabBar.car),
            TabBarItem(type: .map, container: container, withNavBar: false, title: Constants.TabBar.map)
        ]
        return items
    }
    
    private func configureTabBar() {
        let white = MainTheme.shared.appColors.white
        self.tabBar.tintColor = white
        UITabBar.appearance().barTintColor = white
        
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = MainTheme.shared.appColors.tabBarBackgroundColor
    }
}

extension UITabBarController {
    func select(type: TabBarControllersType, postAction: Action<TabBarItem>? = nil) {
        guard let tabBar = self as? TabBarViewController,
              let selectedItem = tabBar.items.first(where: {$0.type == type}) else { return }
        selectedViewController = selectedItem.controller
        postAction?(selectedItem)
    }
}
