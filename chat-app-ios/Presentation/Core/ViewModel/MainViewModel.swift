//
//  MainViewModel.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation
import RxCocoa
import RxSwift

class MainViewModel: ViewModel {
    var disposeBag: DisposeBag! = DisposeBag()

    func transform(_ input: Input) -> Output {
        let isLoggedInSubject = PublishSubject<Bool>()
        input.firstLoadTrigger
            .map { _ in
                let token = Defaults.get(.accessToken) ?? ""
                return !token.isEmpty
            }
            .bind(to: isLoggedInSubject)
            .disposed(by: disposeBag)
        return Output(
            isLoggedIn: isLoggedInSubject.asDriver(onErrorJustReturn: false))
    }
}

extension MainViewModel {
    struct Input {
        let firstLoadTrigger: PublishSubject<Void>
    }

    struct Output {
        let isLoggedIn: Driver<Bool>
    }
}
