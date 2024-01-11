//
//  MainViewController.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/05.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Profile", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    lazy var settingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Setting", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    private let viewModel: MainViewModelLogic
    private let disposeBag = DisposeBag()

    init(viewModel: MainViewModelLogic) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink

        view.addSubview(titleLabel)
        view.addSubview(stackView)

        stackView.addArrangedSubview(logoutButton)
        stackView.addArrangedSubview(profileButton)
        stackView.addArrangedSubview(settingButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),

            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 180)
        ])

        viewModel.customerName
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)

        logoutButton.rx.tap
            .bind(to: viewModel.logoutButtonDidTapped)
            .disposed(by: disposeBag)

        profileButton.rx.tap
            .bind(to: viewModel.profileButtonDidTapped)
            .disposed(by: disposeBag)

        settingButton.rx.tap
            .bind(to: viewModel.settingButtonDidTapped)
            .disposed(by: disposeBag)
    }
}
