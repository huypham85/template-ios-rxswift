//
//  ResponseType.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation

protocol DTOType: Codable {
    associatedtype M: Any

    func asDomain() -> M
}

protocol ResponseType: Decodable {
    associatedtype DTO: DTOType
}

struct Response<DTO: DTOType>: ResponseType {
    var status: String
    var data: DTO?
    var message: String?
}
