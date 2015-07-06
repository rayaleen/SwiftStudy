//
//  PullToCloseFootView.swift
//  PullUpToClose
//
//  Created by chenbo on 3/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import UIKit

class PullToCloseFootView: UIView {

    var textLabel : UILabel =  UILabel()
    var scrollView : UIScrollView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }
    
    func initViews(){
        self.textLabel.textAlignment = .Center
        self.textLabel.textColor = UIColor.blackColor()
        self.textLabel.text = "Pull to Close"
        self.textLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.textLabel)
        self.addConstraint(NSLayoutConstraint(item: self.textLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.textLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0))
    }
    
    func reigsterScrollView(scrollView : UIScrollView){
        self.scrollView = scrollView
        if scrollView.isKindOfClass(UITableView.self) {
            let tableView = scrollView as! UITableView
            var totalHeight : CGFloat = 0.0
            for var section = 0; section < tableView.numberOfSections(); section++ {
                for var row = 0; row < tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section); row++ {
                    let index = NSIndexPath(forRow: row, inSection: section)
                    if let height = tableView.delegate?.tableView?(tableView, heightForRowAtIndexPath: index){
                        totalHeight += height
                    }
                }
            }
        }
        scrollView.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {


    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
