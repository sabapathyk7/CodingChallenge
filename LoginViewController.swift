//
//  ViewController.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 10/10/21.
//

import UIKit

import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        headerLabel.text = "Login"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()

        button.setTitle("Login", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.setTitleColor(.systemGray, for: .disabled)
        button.isEnabled = false

        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 16.0

        return stackView
    }()
    
    private let disposeBag = DisposeBag()
}



