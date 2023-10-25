//
//  TabBarViewModel.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import DITranquillity
import Combine
import MintLogger

// MARK: - View Model
final class TabBarViewModel: Loggable {
    private var bag = CancelBag()
    
    let input = Input()
    let output = Output()
        
    init() {
        self.setUpBindings()
    }
    
    // MARK: - SetUp Bindings
    private func setUpBindings() {
    }
}

extension TabBarViewModel {
    class Input {
        var viewWillAppear = PublishedAction<Void>()
    }
    
    class Output {}
}
