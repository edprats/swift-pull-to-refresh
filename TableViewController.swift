//
//  TableViewController.swift
//  Pull To Refresh Table View
//
//  Created by Eduardo Prats on 2/9/16.
//  Copyright © 2016 edprats. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var groceries = ["Milk", "Carrots", "Fish", "Apples"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Groceries"
        
        self.refreshControl?.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(groceries.count)
        return groceries.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("groceryCell", forIndexPath: indexPath)
        cell.textLabel?.text = groceries[indexPath.row]
        
        return cell
    }

    func handleRefresh(refreshControl: UIRefreshControl) {
        let newGroceryItem = "Milano Fudge Cookies"
        groceries.append(newGroceryItem)
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }

}
