//
//  UIViewController+Rx.swift
//  chat-app-ios
//
//  Created by Huy Pham on 20/06/2023.
//

import RxCocoa
import RxSwift
import UIKit
import SVProgressHUD

/**
 ViewController view states
 */
public enum ViewControllerViewState: Equatable {
    case viewWillAppear
    case viewDidAppear
    case viewWillDisappear
    case viewDidDisappear
    case viewDidLoad
    case viewDidLayoutSubviews
}

/**
 UIViewController view state changes.
 Emits a Bool value indicating whether the change was animated or not
 */

public extension Reactive where Base: UIViewController {
    var viewDidLoad: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLoad))
            .map { _ in }
    }

    var viewDidLayoutSubviews: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLayoutSubviews))
            .map { _ in }
    }

    var viewWillAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillAppear))
            .map { $0.first as? Bool ?? false }
    }

    var viewDidAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidAppear))
            .map { $0.first as? Bool ?? false }
    }

    var viewWillDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillDisappear))
            .map { $0.first as? Bool ?? false }
    }

    var viewDidDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidDisappear))
            .map { $0.first as? Bool ?? false }
    }

    /**
     Observable sequence of the view controller's view state

     This gives you an observable sequence of all possible states.

     - returns: Observable sequence of AppStates
     */
    var viewState: Observable<ViewControllerViewState> {
        return Observable.of(
            viewDidLoad.map { _ in ViewControllerViewState.viewDidLoad },
            viewDidLayoutSubviews.map { _ in ViewControllerViewState.viewDidLayoutSubviews },
            viewWillAppear.map { _ in ViewControllerViewState.viewWillAppear },
            viewDidAppear.map { _ in ViewControllerViewState.viewDidAppear },
            viewWillDisappear.map { _ in ViewControllerViewState.viewWillDisappear },
            viewDidDisappear.map { _ in ViewControllerViewState.viewDidDisappear }
        )
        .merge()
    }
}

extension Reactive where Base: UIViewController {
    var isLoading: Binder<Bool> {
        return Binder(base) { viewController, isLoading in
            // Client request: remove loader and lock UI at native screen
            if isLoading {
                SVProgressHUD.show()
                viewController.view.isUserInteractionEnabled = false
            } else {
                SVProgressHUD.dismiss()
                viewController.view.isUserInteractionEnabled = true
            }
        }
    }
}
