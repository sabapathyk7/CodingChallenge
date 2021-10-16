//
//  UISetupableType.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 11/10/21.
//

import UIKit

protocol UISetupableType {
    func setupUI()
}

extension UISetupableType where Self: UIViewController {
    func setupUI() {}
}
