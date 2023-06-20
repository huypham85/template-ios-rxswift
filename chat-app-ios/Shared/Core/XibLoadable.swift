//
//  XibLoadable.swift
//  chat-app-ios
//
//  Created by Huy Pham on 16/06/2023.
//

import Foundation
import UIKit

protocol XibLoadable {}

extension XibLoadable where Self: UIViewController {
    static var className: String {
        return String(describing: self)
    }

    static func loadFromNib() -> Self {
        Log.info("Initializing \(className)")
        return self.init(nibName: className, bundle: nil)
    }
}

extension UIViewController: XibLoadable {}
