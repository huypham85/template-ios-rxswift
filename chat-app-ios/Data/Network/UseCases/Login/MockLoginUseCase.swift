//
//  MockLoginUseCase.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation
import RxSwift

final class MockLoginUseCase: LoginUseCase {
    func login(_ loginRequest: LoginRequest) -> Observable<LoginModel> {
        let loginDto = LoginDTO(accessToken: "abcxyz")
        let loginModel = loginDto.asDomain()
        return Observable.just(loginModel)
    }
}
