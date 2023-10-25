//
//  TabBarViewController.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import DITranquillity
import MintRouter

// MARK: - View Controller
final class TabBarViewController: UITabBarController {
    
    // MARK: - UI
    var viewModel: TabBarViewModel!
    private var bag = CancelBag()
    private var tabBarTag: Bool = true
    
    // MARK: - Life cycle
    var items: [TabBarItem] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.input.viewWillAppear.send(())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Setup
    func createItems(container: DIContainer) -> [TabBarItem] {
        items = [
            TabBarItem(type: .main, container: container, withNavBar: false, title: "Главная"),
            TabBarItem(type: .list, container: container, withNavBar: false, title: "Заявки"),
            TabBarItem(type: .add, container: container, withNavBar: false, title: ""),
            TabBarItem(type: .car, container: container, withNavBar: false, title: "Техника"),
            TabBarItem(type: .map, container: container, withNavBar: false, title: "Карта")
        ]
        return items
    }
    
    private func configureTabBar() {
        let white = MainTheme.shared.appColors.white
//        self.tabBar.barTintColor = white
//        UITabBar.appearance().tintColor = white
        
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
