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
    
    // MARK: - View Life Cycle

      override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
        welcomeLabel.text = welcomeMessage
      }
    
}
