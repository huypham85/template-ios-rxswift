//
//  Date+.swift
//  chat-app-ios
//
//  Created by Huy Pham on 15/06/2023.
//

import Foundation

extension Date {
    func toString(withFormat format: String? = "yyyy/MM/dd HH:mm") -> String {
        let dateFormat = DateFormatter()
        dateFormat.calendar = Calendar(identifier: .gregorian)
        dateFormat.dateFormat = format
        return dateFormat.string(from: self as Date)
    }
}
