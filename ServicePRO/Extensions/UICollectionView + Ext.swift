//
//  UICollectionView + Ext.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(of type: T.Type, at index: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withReuseIdentifier: type.className(),
                                                      for: index) as! T
        return cell
    }
    
    func register<T: UICollectionViewCell>(of type: T.Type) {
        self.register(type, forCellWithReuseIdentifier: type.className())
    }
}

