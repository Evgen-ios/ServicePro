//
//  AppTheme.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit

public protocol AppTheme {
    var appColors: AppColors { get }
}

public struct MainTheme: AppTheme {
    public static var shared: AppTheme = MainTheme()

    // MARK: - Colors
    public var appColors = AppColors()
}

// MARK: - Colors
public struct AppColors {
    public var white: UIColor = .white
    public var machineryCell: UIColor = #colorLiteral(red: 0.1607826054, green: 0.164706409, blue: 0.1882340014, alpha: 1)
    public var background: UIColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
    public var tabBarBackgroundColor = #colorLiteral(red: 0.1372536123, green: 0.1450983584, blue: 0.1411764324, alpha: 1)
}
