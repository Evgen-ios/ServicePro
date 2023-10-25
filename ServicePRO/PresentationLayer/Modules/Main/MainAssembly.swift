//
//  MainAssembly.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import Foundation
import DITranquillity

final class MainPart: DIPart {
    static func load(container: DIContainer) {
        container.register(MainViewModel.init)
            .as(MainViewModel.self)
            .lifetime(.objectGraph)
        
        container.register {
            MainViewController.loadFromNib()
        }
        .as(MainViewController.self)
        .injection({ $0.viewModel = $1 })
        .lifetime(.objectGraph)
    }
}

final class MainAssembly {
    class func createModule(_ container: DIContainer) -> MainViewController {
        return container.resolve()
    }
}
