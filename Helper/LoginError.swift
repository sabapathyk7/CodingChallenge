//
//  LoginError.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 11/10/21.
//

import Foundation

enum LoginError: Error {
    case missingPassword
    case missingUsername
    case wrongCredentials
}
