//
//  ChapterTableViewController.swift
//  Fickbok
//
//  Created by Andreas Bom on 2015-07-21.
//  Copyright © 2015 Andreas Bom. All rights reserved.
//

import UIKit

class ChapterViewController: UITableViewController {

    var chapters = Chapters().getListOfChapters()
    
    var detailViewController: DetailViewController? = nil
    
    
    override func viewDidLoad() {
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail1" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.detailItem = indexPath
            }
        }
        
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters.count
        
        

    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if (indexPath.section == 0){
            let chapter = chapters[indexPath.row]
            cell.textLabel!.text = chapter
        }
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Fickbok"
        
        
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if indexPath.row == 0 {
            self.performSegueWithIdentifier("showAlgorithm", sender: self)
        } else if indexPath.row == 1 {
            self.performSegueWithIdentifier("showDrugsAdult", sender: self)
        } else {
            self.performSegueWithIdentifier("showDrugsChildren", sender: self)
        }

    }
  
}

