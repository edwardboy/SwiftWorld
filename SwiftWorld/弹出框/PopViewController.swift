//
//  PopViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/27.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit

class PopViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,CMPopTipViewDelegate {
    
    @IBOutlet weak var listView: UITableView!
    
    var currentPopTipView:CMPopTipView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = .None
        
        listView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        cell.backgroundColor = UIColor.orangeColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if currentPopTipView != nil {
                currentPopTipView?.dismissAnimated(true)
            }
            
            cell.selectionStyle = .None
            
            currentPopTipView = CMPopTipView(title: "Message", message: "You just tapped on \(indexPath.row).")
            
            
            if let currentPopTipView = currentPopTipView {
                currentPopTipView.titleColor = UIColor.orangeColor()
                currentPopTipView.textColor = UIColor.whiteColor()
                currentPopTipView.titleFont = UIFont.italicSystemFontOfSize(22)
                currentPopTipView.textFont = UIFont.boldSystemFontOfSize(18)
                currentPopTipView.maxWidth = 100000
                
                //currentPopTipView.autoDismissAnimated(true, atTimeInterval: 3.00)
                currentPopTipView.presentPointingAtView(cell, inView: tableView, animated: true)
            }
        }
        
    }
    
    func popTipViewWasDismissedByUser(popTipView: CMPopTipView) {
        
    }
}
