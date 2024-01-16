//___FILEHEADER___

import RxSwift
import RxRelay

// MARK: - Dependency

protocol ___VARIABLE_productName___ViewModelDependency: ViewModelDependency {
    // TODO: Declare the set of dependencies required by this viewmodel
}

// MARK: - ViewModelInput

protocol ___VARIABLE_productName___ViewModelInput {
    // TODO: Declare input the viewController can invoke
}

// MARK: - ViewModelOutput

protocol ___VARIABLE_productName___ViewModelOutput {
    // TODO: Declare output the viewController needed
}

// MARK: - ViewModelLogic

typealias ___VARIABLE_productName___ViewModelLogic = ___VARIABLE_productName___ViewModelInput & ___VARIABLE_productName___ViewModelOutput

// MARK: - ViewModel

final class ___VARIABLE_productName___ViewModel:
    ViewModel<___VARIABLE_productName___ViewModelDependency, ___VARIABLE_productName___Coordinatable>,
    ___VARIABLE_productName___ViewModelLogic
{
    private let disposeBag = DisposeBag()

    // TODO: - Bind Input & Output
}
