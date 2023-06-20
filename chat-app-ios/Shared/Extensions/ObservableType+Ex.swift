//
//  ObservableType+Ex.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {

    public func catchErrorJustComplete() -> Observable<Element> {
        return self.catch { _ in
            return Observable.empty()
        }
    }

    public func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }

    public func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }

    public func mapToOptional() -> Observable<Element?> {
        return map { value -> Element? in value }
    }

    public func unwrap<T>() -> Observable<T> where Element == T? {
        return flatMap { Observable.from(optional: $0) }
    }
}

extension SharedSequenceConvertibleType {
    public func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
    
    public func mapToOptional() -> SharedSequence<SharingStrategy, Element?> {
        return map { value -> Element? in value }
    }
    
    public func unwrap<T>() -> SharedSequence<SharingStrategy, T> where Element == T? {
        return flatMap { SharedSequence.from(optional: $0) }
    }
}

