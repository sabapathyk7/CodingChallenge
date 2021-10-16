//
//  MainViewController.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 12/10/21.
//

import UIKit

class MainViewController: UIViewController {

    var usernameLabel: UILabel = UILabel()
    var stringPassed: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view = UIView()
        
        
        usernameLabel.text = "This is a test message that should be centered."
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.lineBreakMode = .byWordWrapping
        usernameLabel.numberOfLines = 0
        usernameLabel.textAlignment = .center
        
        self.view.addSubview(usernameLabel)
        
        usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameLabel.text = "Saba"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
