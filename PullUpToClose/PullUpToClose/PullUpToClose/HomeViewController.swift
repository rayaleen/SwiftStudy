//
//  ViewController.swift
//  PullUpToClose
//
//  Created by chenbo on 3/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {

    @IBOutlet weak var tableview: UITableView!
    var data : [String]?
    var animator : NavigationAnimator = NavigationAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = ["Pull To Close"]
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.navigationController?.delegate = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier("tableviewcell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.data?[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.data!.count;

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableview.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        if operation == .Pop {
            return self.animator
        }
        return nil
    }
}

