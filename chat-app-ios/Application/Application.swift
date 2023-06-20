//
//  Application.swift
//  chat-app-ios
//
//  Created by Huy Pham on 16/06/2023.
//

import Foundation
import UIKit

class Application {
    static let shared = Application()

    func configureMainInterface(in window: UIWindow?) {
        guard let window = window else { return }
        window.overrideUserInterfaceStyle = .light
        let rootViewController = MainViewController.create()
        window.rootViewController = rootViewController
    }

    func changeRootViewMainWindow(viewController: UIViewController,
                                  animated: Bool = true,
                                  completion: (() -> Void)? = nil) {
        guard let mainWindow = SceneDelegate.shared?.window else { return }
        UIView.transition(
            with: mainWindow,
            duration: animated ? 0.5 : 0.0,
            options: .transitionCrossDissolve,
            animations: nil) { _ in
                mainWindow.rootViewController = viewController
                mainWindow.makeKeyAndVisible()
                completion?()
            }
    }
}
