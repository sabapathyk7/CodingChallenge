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

    private var loginViewModel: LoginViewModel

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
        self.loginViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        
        bindViewModel()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        setupFields()
    }
}

extension LoginViewController: UISetupableType {
    
    func setupUI() {
        
        view.backgroundColor = .systemTeal
        
        navigationItem.title = loginViewModel.navigationTitle
        
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
    
    func setupFields(){
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController {
    
    func bindViewModel() {
//        let outputs = viewModel.configure(input: LoginViewModel.Input(username: usernameTextField.rx.text.orEmpty.asObservable(), password: passwordTextField.rx.text.orEmpty.asObservable()))
//
//        outputs.isLoginAllowed.drive(loginButton.rx.isEnabled).disposed(by: disposeBag)
//
//        loginButton.rx.tap.throttle(.seconds(1), scheduler: MainScheduler.instance).bind {
//            debugPrint("Submit")
//        }.disposed(by: disposeBag)
        
        let output = loginViewModel.transform(LoginViewModel.Input(
                                                username: usernameTextField.rx.text.orEmpty.asObservable(),
                                                password: passwordTextField.rx.text.orEmpty.asObservable(),
                                                loginButton: loginButton.rx.tap.asObservable()))
        output.isLoginAllowed.drive(loginButton.rx.isEnabled).disposed(by: disposeBag)
        output.loginSuccessful.drive(onNext: goToMainScreen).disposed(by: disposeBag)
    }
    
    private func goToMainScreen() {
        
        let mainVC = MainViewController()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
}
