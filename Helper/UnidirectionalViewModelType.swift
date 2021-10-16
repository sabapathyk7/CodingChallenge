//
//  UnidirectionalViewModelType.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 11/10/21.
//

import Foundation

protocol InputType {}

protocol OutputType {}

protocol UnidirectionalViewModelType: ViewModelType {
    
    associatedtype Input: InputType
    associatedtype Output: OutputType

    func transform(_ input: Input) -> Output
}
