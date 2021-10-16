//
//  LoginViewModel.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 11/10/21.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel: UnidirectionalViewModelType {
    
    
    
    let disposeBag = DisposeBag()
    let navigationTitle: String = "Login Screen"
    
    private let loginEventSubject = PublishSubject<Void>()
    private let messageSubject = BehaviorSubject<String>(value: "")
    
    struct Input: InputType {
        let username: Observable<String>
        let password: Observable<String>
        let loginButton: Observable<Void>
    }
    
    struct Output: OutputType {
        let isLoginAllowed: Driver<Bool>
        let loginSuccessful: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        handleValidInputMessage(input)
        handleLoginButtonTap(input)
        return Output(isLoginAllowed: inputIsValid(input), loginSuccessful: loginSuccessful)
    }
    
}


private extension LoginViewModel {
    
    var messageText: Driver<String> {
        messageSubject.asDriver(onErrorJustReturn: "")
    }
    var loginSuccessful: Driver<Void> {
        loginEventSubject.asDriver(onErrorDriveWith: Driver.never())
    }
    
    func inputIsValid(_ input: Input) -> Driver<Bool> {
        Observable
            .combineLatest(input.username, input.password)
            .map { username, pass  in
                //username.isValidUserName && pass.isValidPassword
                !username.isEmpty && !pass.isEmpty
            }.asDriver(onErrorJustReturn: false)
    }
    
    func handleValidInputMessage(_ input: Input) {
        Observable
            .combineLatest(input.username, input.password)
            .map { (username, password) in
                if !username.isValidUserName {
                    return "Enter proper user name"
                } else if !password.isValidPassword {
                    return "Password not meeting the criteria"
                } else {
                    return ""
                }
            }.subscribe(messageSubject)
            .disposed(by: disposeBag)
    }
    
    func handleLoginButtonTap(_ input: Input) {
        let result = input.loginButton
            .withLatestFrom(Observable.combineLatest(input.username, input.password))
            .map { (username, password) -> Bool in
                if !username.isValidUserName {
                    return false
                } else if !password.isValidPassword {
                    return false
                } else {
                    return true
                }
            }
            .share()
        
        result.map { _ in "" }.subscribe(messageSubject).disposed(by: disposeBag)
        result.map { _ in }.subscribe(loginEventSubject).disposed(by: disposeBag)
    }
}
