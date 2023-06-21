//
//  LoginViewModel.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation
import RxCocoa
import RxOptional
import RxSwift

class LoginViewModel: ViewModel {
    var loginUseCase: LoginUseCase
    var disposeBag: DisposeBag! = DisposeBag()
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }

    func transform(_ input: Input) -> Output {
        let indicator = RxIndicator()
        let textInput = Observable.combineLatest(
            input.username.filterNil(),
            input.password.filterNil()
        )

        let isLoginEnabled = textInput.map { username, password in
            if username.isEmpty ||
                password.isEmpty ||
                password.count < 8 {
                return false
            }
            return true
        }
        let loginResponse = input.loginTrigger
            .withLatestFrom(textInput)
            .map { username, password in
                LoginRequest(username: username, password: password)
            }
            .flatMapLatest { [weak self] request -> Observable<LoginModel> in
                guard let self = self else { return .empty() }
                return self.loginUseCase.login(request)
                    .trackActivity(indicator)
            }
        return Output(
            isLoginEnabled: isLoginEnabled.asDriver(onErrorJustReturn: false),
            isLoading: indicator.asDriver(),
            loginResponse: loginResponse.asDriverOnErrorJustComplete()
        )
    }
}

extension LoginViewModel {
    struct Input {
        var username: Observable<String?>
        var password: Observable<String?>
        var loginTrigger: Observable<Void>
    }

    struct Output {
        var isLoginEnabled: Driver<Bool>
        var isLoading: Driver<Bool>
        var loginResponse: Driver<LoginModel>
    }
}
