//
//  ProfileViewController.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "MVC VC"
        return label
    }()

    lazy var settingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Setting", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen

        view.addSubview(titleLabel)
        view.addSubview(settingButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            settingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            settingButton.widthAnchor.constraint(equalToConstant: 200),
            settingButton.heightAnchor.constraint(equalToConstant: 80)
        ])

        settingButton.rx.tap
            .bind(with: self) { owner, _ in
                guard let navigationController = owner.navigationController else { return }
                class SettingDep: SettingDependency {}
                let component = SettingComponent(dependency: SettingDep())
                let coordinator = SettingCoordinator(component: component, navigationController: navigationController)
                coordinator.start(.setVC(animated: true))
            }
            .disposed(by: disposeBag)
    }
}
