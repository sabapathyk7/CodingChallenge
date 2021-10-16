//
//  ValidationCheck.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 11/10/21.
//

import Foundation

extension String {
    var isValidUserName: Bool {
        let userNameRegEx = "^[A-Za-z0-9_-]*$"
        let userNamePred = NSPredicate(format:"SELF MATCHES %@", userNameRegEx)
        return userNamePred.evaluate(with: self)
    }
    var isValidPassword: Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[0-9])(?=.*[@!_?])(?=.*[A-Z]).{5,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: self)
    }
}
