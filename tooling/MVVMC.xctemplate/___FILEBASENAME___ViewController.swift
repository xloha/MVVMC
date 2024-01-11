//___FILEHEADER___

import UIKit
import RxSwift
import RxCocoa

final class ___VARIABLE_productName___ViewController: UIViewController {

    private let viewModel: ___VARIABLE_productName___ViewModelLogic
    private let disposeBag = DisposeBag()

    init(viewModel: ___VARIABLE_productName___ViewModelLogic) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
