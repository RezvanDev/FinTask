//
//  Builder.swift
//  FinTask
//
//  Created by Иван Незговоров on 24.06.2024.
//

import UIKit

protocol BuilderProtocol {
    static func createTabBarController() -> UIViewController
}

class Builder: BuilderProtocol {
    
    static func createTabBarController() -> UIViewController {
        let tabBarView = TabBarViewController()
        return tabBarView
    }
}
