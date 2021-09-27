//
//  EssentialTableViewCell.swift
//  firstapp
//
//  Created by Dev on 26/09/2021.
//  Copyright © 2021 Dev. All rights reserved.
//

import Foundation
import UIKit

class EssentialTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    private var essential = Essential()
    
    public func setEssential(_ essential: Essential) {
        self.essential = essential
        descriptionLabel.text = essential.description
        titleLabel.text = essential.title
    }
    
}
