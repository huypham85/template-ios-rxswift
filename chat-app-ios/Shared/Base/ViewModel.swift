//
//  ViewModel.swift
//  chat-app-ios
//
//  Created by Huy Pham on 15/06/2023.
//

import Foundation
import RxSwift

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    func transform(_ input: Input) -> Output
    var disposeBag: DisposeBag! { get set }
}

protocol ViewModelBased {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
    var disposeBag: DisposeBag! { get set }
    func bindViewModel()
}
