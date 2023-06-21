//
//  ViewController.swift
//  chat-app-ios
//
//  Created by Huy Pham on 15/06/2023.
//

import RxSwift
import UIKit

class LoginViewController: BaseViewController, ViewModelBased {
    // MARK: - Outlets

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    // MARK: - Variables

    var viewModel: LoginViewModel!
    var disposeBag: DisposeBag! = DisposeBag()

    // MARK: - View's life cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    // MARK: - Methods

    func bindViewModel() {
        let input = LoginViewModel.Input(username: usernameTextField.rx.text.distinctUntilChanged(),
                                         password: passwordTextField.rx.text.distinctUntilChanged(),
                                         loginTrigger: loginButton.rx.tap.do(onNext: { [weak self] _ in
                                             self?.view.endEditing(true)
                                         }).mapToVoid())
        let output = viewModel.transform(input)
        output.isLoading
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
        output.isLoginEnabled
            .drive(loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        output.loginResponse
            .drive(onNext: { [weak self] loginModel in
                self?.showAlertViewController(title: "Login Successfully \(String(describing: loginModel.accessToken))",
                                              actions: [],
                                              cancel: "OK")
            })
            .disposed(by: disposeBag)
    }
}

extension LoginViewController {
    static func create() -> LoginViewController {
        let viewController = LoginViewController.loadFromNib()
        viewController.viewModel = LoginViewModel(loginUseCase: MockLoginUseCase())
        return viewController
    }
}
