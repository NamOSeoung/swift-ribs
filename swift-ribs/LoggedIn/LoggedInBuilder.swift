//
//  LoggedInBuilder.swift
//  swift-ribs
//
//  Created by OSeung Nam on 2021/07/12.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    
    var loggedInViewController: LoggedInViewControllable { get }
}

final class LoggedInComponent: Component<LoggedInDependency> {
    fileprivate var loggedInViewController: LoggedInViewControllable {
           return dependency.loggedInViewController
       }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    //필요한 DI를 Builder 에서 코드로 구현함
    func build(withListener listener: LoggedInListener) -> LoggedInRouting {
           let component = LoggedInComponent(dependency: dependency)
           let interactor = LoggedInInteractor()
           interactor.listener = listener

           let offGameBuilder = OffGameBuilder(dependency: component)
           let ticTacToeBuilder = TicTacToeBuilder(dependency: component)
           return LoggedInRouter(interactor: interactor,
                                 viewController: component.loggedInViewController,
                                 offGameBuilder: offGameBuilder,
                                 ticTacToeBuilder: ticTacToeBuilder)
       }
}
