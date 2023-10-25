//
//  AppTheme.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit

public protocol AppTheme {
    func apply()
    var appColors: AppColors { get }
}

public struct MainTheme: AppTheme {
    public static var shared: AppTheme = MainTheme()

    public func apply() {
        self.configureTabBar()
    }
    
    func configureTabBar() {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }

    // MARK: - Colors
    public var appColors = AppColors()
}

// MARK: - Colors
public struct AppColors {
    public var clear: UIColor = .clear
    public var white: UIColor = .white
    public var black: UIColor = .black
    public var text: UIColor = #colorLiteral(red: 0.5052941442, green: 0.550481379, blue: 0.6009694934, alpha: 1)
    public var light: UIColor = #colorLiteral(red: 0.2918587923, green: 0.5673767924, blue: 0.9823846221, alpha: 1)
    public var ligthBlue: UIColor = #colorLiteral(red: 0.6061575413, green: 0.7694695592, blue: 0.9998008609, alpha: 1)
    
    public var blue: UIColor = #colorLiteral(red: 0.3527824283, green: 0.7686437964, blue: 0.9646901488, alpha: 1)
    public var red: UIColor = #colorLiteral(red: 0.9922158122, green: 0.5450646877, blue: 0.5019856691, alpha: 1)
    public var green: UIColor = #colorLiteral(red: 0.3920673728, green: 0.7686362267, blue: 0.4000167847, alpha: 1)
    public var yellow: UIColor = #colorLiteral(red: 0.964740932, green: 0.8078303933, blue: 0.270680517, alpha: 1)
    public var background: UIColor = #colorLiteral(red: 0.1215671524, green: 0.1294121146, blue: 0.1294115484, alpha: 1)
    public var tabBarBackgroundColor = #colorLiteral(red: 0.1372536123, green: 0.1450983584, blue: 0.1411764324, alpha: 1)
}
