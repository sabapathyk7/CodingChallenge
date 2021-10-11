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
    
    let navigationTitle: String = "Login Screen"
    
    struct Input: InputType {
        let username: Observable<String>
        let password: Observable<String>
    }
    
    struct Output: OutputType {
        let isLoginAllowed: Driver<Bool>
    }
    
    func configure(input: Input) -> Output {
        let isLoginAllowed = Observable.combineLatest(input.username, input.password) { (username, password) in
            return !username.isEmpty && !password.isEmpty
        }.asDriver(onErrorJustReturn: false)
        return Output(isLoginAllowed: isLoginAllowed)
    }
    
}
