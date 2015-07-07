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
    var animator : UIViewControllerAnimatedTransitioning?
    var selectedCell : UITableViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = ["Close Animiation 1", "Close Animiation 2"]
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.navigationController?.delegate = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier("tableviewcell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.data?[indexPath.row]
        cell.imageView?.image = UIImage(named: "onepiece")
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.data!.count;

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableview.deselectRowAtIndexPath(indexPath, animated: true)
        self.selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        if indexPath.row == 0 {
            self.performSegueWithIdentifier("pushtoclosenavigation", sender: nil)
        }else if indexPath.row == 1 {
            self.performSegueWithIdentifier("pushtosnapimagenavigation", sender: nil)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        self.animator = nil
        if operation == .Pop && fromVC.isKindOfClass(SecondViewController.self) {
            self.animator = NavigationAnimator()
        }
        if operation == .Push && toVC.isKindOfClass(SnapImageViewController.self){
            let snapAnimator = SnapImageAnimator()
            snapAnimator.operationType = .Push
            snapAnimator.selectedImageView = self.selectedCell?.imageView
            self.animator = snapAnimator;
        }
        return self.animator
    }
    
}

