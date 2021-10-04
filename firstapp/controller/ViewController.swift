//
//  ViewController.swift
//  firstapp
//
//  Created by Dev on 26/09/2021.
//  Copyright © 2021 Dev. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var githubRepositoriesButton: UIButton!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS Essentials"
        label.text = "Hello World from the next iOS rock star"
        button.addTarget(self, action: #selector(launchHelloVC), for: .touchUpInside)
        githubRepositoriesButton.addTarget(self, action: #selector(displayGithubRepositories), for: .touchUpInside)’
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        usernameTextField.endEditing(true)
    }
    
    // MARK: - Actions
    
    @objc
    func launchHelloVC(){
        let storyBoard = UIStoryboard(name: "HelloViewController", bundle: nil)
        let helloViewController = storyBoard.instantiateViewController(withIdentifier: "HelloViewController") as! HelloViewController
        helloViewController.welcomeMessage = usernameTextField.text
        self.navigationController?.pushViewController(helloViewController, animated: true)
    }
    
    @objc
    func displayGithubRepositories() {
        guard let username = usernameTextField.text else {
            return
        }
        let request = AF.request("https://api.github.com/users/\(username)/repos")
        request.responseDecodable(of: [GithubRepository].self) {response in
            switch response.result {
            case .success:
                if let repositories = response.value {
                    self.displayAlert(title: "Vous avez \(repositories.count) repositories publics", message: "\(repositories[0].name) est l'un de vos repositories")
                }
            case .failure:
                self.displayAlert(title: "Error", message: "\(String(describing: response.error))")
            }
        }
    }
    
    func displayAlert(title: String, message: String){
      let alertConroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertConroller.addAction(UIAlertAction(title: "Ok", style: .default ))
        present(alertConroller, animated: true, completion: nil)
    }
    
}

