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

    private var viewModel: LoginViewModel

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
    
    private lazy var loginButton: UIButton = {
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
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
}

extension LoginViewController: UISetupableType {
    func setupUI() {
        
        view.backgroundColor = .systemTeal
        
        navigationItem.title = viewModel.navigationTitle
        
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            stackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1, constant: -100),
        ])
        
    }
}

extension LoginViewController {
    
    func bindViewModel() {
    
    }
}


