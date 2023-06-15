//
//  NSObject+.swift
//  chat-app-ios
//
//  Created by Huy Pham on 15/06/2023.
//

import Foundation

protocol WithCreation: AnyObject {}

extension NSObject: WithCreation {}

extension WithCreation where Self: NSObject {
    @discardableResult
    func with(_ closure: @escaping (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}
