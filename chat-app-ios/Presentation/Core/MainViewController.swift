//
//  MainViewController.swift
//  chat-app-ios
//
//  Created by Huy Pham on 16/06/2023.
//

import RxCocoa
import RxSwift
import UIKit

class MainViewController: BaseViewController, ViewModelBased {
    // MARK: - Variables

    var viewModel: MainViewModel!
    var disposeBag: DisposeBag! = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Log.info("\(self) \(#function)")
    }
    
    // MARK: - Methods
    
    func bindViewModel() {
        let viewWillAppearSubject = PublishSubject<Void>()
        rx.viewWillAppear
            .take(1)
            .mapToVoid()
            .bind(to: viewWillAppearSubject)
            .disposed(by: disposeBag)
        let input = MainViewModel.Input(firstLoadTrigger: viewWillAppearSubject)
        let output = viewModel.transform(input)
        
        output.isLoggedIn
            .drive(onNext: { isLoggedIn in
                if isLoggedIn {
                } else {
                    let vc = LoginViewController.create()
                    Application.shared.changeRootViewMainWindow(viewController: UINavigationController(rootViewController: vc))
                }
            })
            .disposed(by: disposeBag)
    }
}

extension MainViewController {
    static func create() -> MainViewController {
        let viewController = MainViewController.loadFromNib()
        viewController.viewModel = MainViewModel()
        return viewController
    }
}
