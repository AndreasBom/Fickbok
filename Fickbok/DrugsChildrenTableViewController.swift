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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
