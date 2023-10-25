//
//  TabBarAssembly.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import DITranquillity

final class TabBarPart: DIPart {
    static func load(container: DIContainer) {
        container.register(TabBarViewModel.init)
            .as(TabBarViewModel.self)
            .lifetime(.objectGraph)
        
        container.register {
            TabBarViewController.loadFromNib()
            }
            .as(TabBarViewController.self)
            .injection({ $0.viewModel = $1 })
            .lifetime(.objectGraph)
    }
}

final class TabBarAssembly {
    class func createModule(_ container: DIContainer) -> TabBarViewController {
        return container.resolve()
    }
}
