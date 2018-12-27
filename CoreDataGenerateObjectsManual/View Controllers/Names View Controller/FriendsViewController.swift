//
//  ViewController.swift
//  CoreDataGenerateObjectsManual
//
//  Created by Oluwatobi Omotayo on 23/12/2018.
//  Copyright © 2018 Hollaport. All rights reserved.
//

import UIKit
import CoreData

class FriendsViewController: UITableViewController {
    
    // MARK: -
    
    private var coreDataManager = CoreDataManager(modelName: "Friends")
    
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Friends"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        setupAddButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchFriends()
    }
    
    // MARK: -
    
    func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleFindTapped))
    }
    
    @objc func handleAddTapped() {
        let friend = Friend(context: coreDataManager.mainManagedObjectContext)
        friend.firstname = "Tobi"
        friend.lastname = "Omotayo"
        friend.nickname = "tobitech"
    }
    
    @objc func handleFindTapped() {
        let findViewController = FindViewController()
        navigationController?.pushViewController(findViewController, animated: true)
    }
    
    func fetchFriends() {
        let request: NSFetchRequest<Friend> = Friend.fetchRequest()
        
        do {
            friends = try coreDataManager.mainManagedObjectContext.fetch(request)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
        
    }

    // MARK: -
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")

        let friend = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.firstname ?? "") \(friend.lastname ?? "")"
        cell.detailTextLabel?.text = friend.nickname
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

}

