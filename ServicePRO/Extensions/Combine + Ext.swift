//
//  Combine + Ext.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 23.10.2023.
//

import Combine
import UIKit

typealias CancelBag = Set<AnyCancellable>

extension CancelBag {
    mutating func collect(@Builder _ cancellables: () -> [AnyCancellable]) {
        formUnion(cancellables())
    }

    @resultBuilder
    struct Builder {
        static func buildBlock(_ cancellables: AnyCancellable...) -> [AnyCancellable] {
            return cancellables
        }
    }
    
    func cancel() {
        self.forEach {$0.cancel()}
    }
}
