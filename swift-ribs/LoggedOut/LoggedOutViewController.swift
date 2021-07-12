//
//  LoggedOutViewController.swift
//  swift-ribs
//
//  Created by OSeung Nam on 2021/07/12.
//

import RIBs
import RxSwift
import UIKit
import SnapKit
import RxCocoa
import RxGesture


protocol LoggedOutPresentableListener: AnyObject {
//    func login(withPlayer1Name: String?, player2Name: String?)
    func login(email: String, pwd: String)
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    let disposeBag = DisposeBag()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("로그인 테스트 버튼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
        button.rx.tapGesture().when(.recognized)
            .bind{ [weak self] _ in
                self?.listener?.login(email: "developernam92@gmail.com", pwd: "123456")
            }.disposed(by: disposeBag)
    }
}
