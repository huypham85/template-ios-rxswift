//
//  LoginModel.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation

struct LoginModel: Codable {
    var accessToken: String?
}

extension LoginModel {
    init(from dto: LoginDTO) {
        accessToken = dto.accessToken
    }
}
