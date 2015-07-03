//
//  SecondViewController.swift
//  PullUpToClose
//
//  Created by chenbo on 3/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    var footer : PullToCloseFootView?
    var datasource : HomeTableViewDataSource = HomeTableViewDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasource.tableView = self.tableview
        
        self.tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell");
        self.tableview.dataSource = self.datasource
        self.tableview.delegate = self
        footer = PullToCloseFootView(frame: CGRectMake(0, 0, CGRectGetWidth(self.tableview.frame),50));
//        footer?.reigsterScrollView(self.tableview)
        self.tableview.tableFooterView = footer
//        self.tableview.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
        
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView();
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let benchmark = CGRectGetMidY(self.footer!.frame) + CGRectGetHeight(self.footer!.frame) / 2
        if scrollView.contentOffset.y + CGRectGetHeight(self.tableview.frame) > benchmark {
            println("close");
        }
    }

}
