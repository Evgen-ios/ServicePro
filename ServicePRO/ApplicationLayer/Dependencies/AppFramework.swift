//
//  AppFramework.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 23.10.2023.
//

import DITranquillity
import Foundation

public class AppFramework: DIFramework {
    public static func load(container: DIContainer) {
        container.append(part: PresentersPart.self)
    }
}

private class PresentersPart: DIPart {
    static let parts: [DIPart.Type] = [
        TabBarPart.self,
        MainPart.self
    ]

    static func load(container: DIContainer) {
        for part in self.parts {
            container.append(part: part)
        }
    }
}

