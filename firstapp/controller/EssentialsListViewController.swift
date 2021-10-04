//
//  EssentialsListViewController.swift
//  firstapp
//
//  Created by Dev on 26/09/2021.
//  Copyright © 2021 Dev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EssentialsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EssentialTableViewCellDelegate {

    @IBOutlet private weak var tableView: UITableView!
    private let viewCellName: String = "EssentialTableViewCell"
    private var essentials = [NSManagedObject] ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          let managedContext =
            AppDelegate.persistentContainer.viewContext
          let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "EssentialEntity")
          do {
            essentials = try managedContext.fetch(fetchRequest)
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
    }
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: viewCellName, bundle: nil), forCellReuseIdentifier: viewCellName)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        essentials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewCellName) as! EssentialTableViewCell
        let essential = Essential(essentials[indexPath.row].value(forKey: "title") as! String, essentials[indexPath.row].value(forKey: "comments") as! String)
        cell.setEssential(essential)
        cell.essentialTableViewCellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func getSelectedEssential(essential: Essential) {
        let essentialDetailSB = UIStoryboard(name: "EssentialDetailViewController", bundle: nil)
        let essentialDetailViewController = essentialDetailSB.instantiateViewController(identifier: "EssentialDetailViewController") as! EssentialDetailViewController
        essentialDetailViewController.essential = essential
       // display it modally for variety sake !
       present(essentialDetailViewController, animated: true, completion: nil)
    }

}
