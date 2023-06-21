//
//  LoginDTO.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation

struct LoginDTO: DTOType {
    typealias M = LoginModel

    var accessToken: String?

    func asDomain() -> M {
        return M(from: self)
    }
}
