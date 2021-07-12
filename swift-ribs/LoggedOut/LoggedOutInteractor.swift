//
//  LoggedOutInteractor.swift
//  swift-ribs
//
//  Created by OSeung Nam on 2021/07/12.
//

import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoggedOutListener: AnyObject {
//    func didLogin(withPlayer1Name player1Name: String, player2Name: String)
    func didLogin(email: String, pwd: String)
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {
  


    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func login(email: String, pwd: String) {
        listener?.didLogin(email: email, pwd: pwd)
        
    }
    
    private func playerName(_ name: String?, withDefaultName defaultName: String) -> String {
           if let name = name {
               return name.isEmpty ? defaultName : name
           } else {
               return defaultName
           }
       }
}
