//
//  ViewController.swift
//  firstapp
//
//  Created by Dev on 26/09/2021.
//  Copyright © 2021 Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var usernameTextField: UITextField!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS Essentials"
        label.text = "Hello World from the next iOS rock star"
        button.addTarget(self, action: #selector(launchHelloVC), for: .touchUpInside)
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
    
    
}

