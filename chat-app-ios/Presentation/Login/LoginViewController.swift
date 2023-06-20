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
        // Do any additional setup after loading the view.
    }

    // MARK: - Methods

    func bindViewModel() {}
}

extension LoginViewController {
    static func create() -> LoginViewController {
        let viewController = LoginViewController.loadFromNib()
        viewController.viewModel = LoginViewModel()
        return viewController
    }
}
