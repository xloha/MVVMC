//
//  LoginViewController.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/05.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    private let viewModel: LoginViewModelLogic
    private let disposeBag = DisposeBag()

    init(viewModel: LoginViewModelLogic) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        view.addSubview(titleLabel)
        view.addSubview(loginButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 80)
        ])

        viewModel.loginType
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)

        loginButton.rx.tap
            .bind(to: viewModel.loginButtonDidTapped)
            .disposed(by: disposeBag)
    }
}
