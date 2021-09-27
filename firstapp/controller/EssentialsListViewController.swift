//
//  EssentialsListViewController.swift
//  firstapp
//
//  Created by Dev on 26/09/2021.
//  Copyright © 2021 Dev. All rights reserved.
//

import Foundation
import UIKit

class EssentialsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EssentialTableViewCellDelegate {

    @IBOutlet private weak var tableView: UITableView!
    private var essentials = [Essential]()
    private let viewCellName: String = "EssentialTableViewCell"
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        essentials.append(Essential("mock tile", "mock description"))
        essentials.append(Essential("mock dev title", "mock dev description"))
        
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
        cell.setEssential(essentials[indexPath.row])
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
