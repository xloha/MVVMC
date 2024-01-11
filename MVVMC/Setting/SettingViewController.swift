//
//  SettingViewController.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

import UIKit
import RxSwift
import RxCocoa

final class SettingViewController: UIViewController {

    private let viewModel: SettingViewModelLogic
    private let disposeBag = DisposeBag()

    init(viewModel: SettingViewModelLogic) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
