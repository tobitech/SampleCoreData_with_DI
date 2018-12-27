//
//  RootViewController.swift
//  CoreDataGenerateObjectsManual
//
//  Created by Oluwatobi Omotayo on 27/12/2018.
//  Copyright © 2018 Hollaport. All rights reserved.
//

import UIKit
import CoreData

class FindViewController: UITableViewController {
    
    var users = [User]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: -
    
    private var coreDataManager = CoreDataManager(modelName: "Friends")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        navigationItem.title = "Connect"
        
        fetchUsers()
    }
    
    func fetchUsers() {
        let request: NSFetchRequest<Friend> = Friend.fetchRequest()
        
        do {
            let users = try coreDataManager.mainManagedObjectContext.fetch(request)
            self.users = users
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = user.displayName
        
        return cell
    }

}
