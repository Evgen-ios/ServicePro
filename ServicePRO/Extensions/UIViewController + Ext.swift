//
//  UIViewController + Ext.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit

extension UIViewController {
    static func loadFromNib(_ name: String? = nil) -> Self {
        return self.init(nibName: name, bundle: nil)
    }
}
