//
//  DrugsChildrenTableViewController.swift
//  Fickbok
//
//  Created by Andreas Bom on 2015-07-21.
//  Copyright © 2015 Andreas Bom. All rights reserved.
//

import UIKit

class DrugsChildrenTableViewController: UITableViewController {

    var drugsForChildren = DataFetcher().getDrugsForChildren()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drugsForChildren.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let drug = drugsForChildren[indexPath.row]
        cell.textLabel!.text = drug

        return cell
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPdfDetailView" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let menuObject = drugsForChildren[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! PdfViewController
                controller.detailItem = menuObject
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showPdfDetailView", sender: self)
    }
   

}
