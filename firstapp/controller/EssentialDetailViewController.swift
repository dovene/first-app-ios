//
//  EssentialDetailViewController.swift
//  firstapp
//
//  Created by Dev on 27/09/2021.
//  Copyright © 2021 Dev. All rights reserved.
//

import Foundation
import UIKit

class EssentialDetailViewController: UIViewController {
   
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    public var essential = Essential()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = essential.description
        titleLabel.text = essential.title
    }
}
