//
//  HelloViewController.swift
//  firstapp
//
//  Created by Dev on 26/09/2021.
//  Copyright © 2021 Dev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class HelloViewController: UIViewController {
    
    // MARK: - Properties
    
    public var welcomeMessage : String?
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var essentialsButton: UIButton!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var descriptionTextField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
        welcomeLabel.text = "Welcome \(welcomeMessage ?? "")"
        essentialsButton.addTarget(self, action: #selector(launchEssentialsListVC), for: .touchUpInside)
    }
    
    
    
    // MARK: - Actions
    @objc
    func launchEssentialsListVC() {
        saveEssential()
        let storyBoard = UIStoryboard(name: "EssentialsListViewController", bundle: nil)
        let essentialsListViewController = storyBoard.instantiateViewController(withIdentifier: "EssentialsListViewController") as! EssentialsListViewController
    self.navigationController?.pushViewController(essentialsListViewController, animated: true)
    }
 
    func saveEssential() {
        let managedContext =
        AppDelegate.persistentContainer.viewContext
        let essentialEntity =
        NSEntityDescription.entity(forEntityName: "EssentialEntity",
                                   in: managedContext)!
        let essentialObject = NSManagedObject(entity: essentialEntity,
                                              insertInto: managedContext)
        essentialObject.setValue(nameTextField.text, forKey: "title")
        essentialObject.setValue(descriptionTextField.text, forKey: "comments")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}
