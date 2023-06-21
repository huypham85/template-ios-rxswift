//
//  LoginUseCase.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation
import RxSwift

protocol LoginUseCase {
    func login(_ loginRequest: LoginRequest) -> Observable<LoginModel>
}
