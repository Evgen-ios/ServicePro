//
//  NSObject + Ext.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import Foundation

extension NSObjectProtocol {
    @discardableResult
    func apply(_ closure: (Self) -> () ) -> Self {
        { closure(self) }()
        return self
    }
}

