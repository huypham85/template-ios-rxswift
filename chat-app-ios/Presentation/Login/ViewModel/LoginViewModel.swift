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
    var disposeBag: DisposeBag! = DisposeBag()

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
        return Output(
            isLoginEnabled: isLoginEnabled.asDriver(onErrorJustReturn: false),
            isLoading: indicator.asDriver()
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
    }
}
