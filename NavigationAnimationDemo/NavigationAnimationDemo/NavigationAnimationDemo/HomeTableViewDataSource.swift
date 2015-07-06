//
//  homeTableViewDataSource.swift
//  PullUpToClose
//
//  Created by chenbo on 3/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import Foundation
import UIKit
class HomeTableViewDataSource : NSObject,  UITableViewDataSource {
    var tableView : UITableView?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 35
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView?.dequeueReusableCellWithIdentifier("tableViewCell") as! UITableViewCell
        cell.textLabel?.text = "line \(indexPath.row)"
        return cell
    }
}