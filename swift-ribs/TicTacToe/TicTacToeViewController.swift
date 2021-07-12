//
//  TicTacToeViewController.swift
//  swift-ribs
//
//  Created by OSeung Nam on 2021/07/12.
//

import RIBs
import RxSwift
import UIKit

protocol TicTacToePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TicTacToeViewController: UIViewController, TicTacToePresentable, TicTacToeViewControllable {

    weak var listener: TicTacToePresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
    }
}
