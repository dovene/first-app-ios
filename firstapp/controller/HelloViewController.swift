//
//  HelloViewController.swift
//  firstapp
//
//  Created by Dev on 26/09/2021.
//  Copyright © 2021 Dev. All rights reserved.
//

import Foundation
import UIKit

class HelloViewController: UIViewController {
    
    // MARK: - Properties
    
    public var welcomeMessage : String?
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var essentialsButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
        welcomeLabel.text = "Welcome \(String(describing: welcomeMessage))"
        essentialsButton.addTarget(self, action: #selector(launchEssentialsListVC), for: .touchUpInside)
    }
    
    
    
    // MARK: - Actions
    @objc
    func launchEssentialsListVC(){
        let storyBoard = UIStoryboard(name: "EssentialsListViewController", bundle: nil)
        let essentialsListViewController = storyBoard.instantiateViewController(withIdentifier: "EssentialsListViewController") as! EssentialsListViewController
        //  helloViewController.welcomeMessage = usernameTextField.text
        self.navigationController?.pushViewController(essentialsListViewController, animated: true)
    }
    
    
}
