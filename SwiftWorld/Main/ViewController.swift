//
//  ViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/11.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    lazy private var listView: UITableView = {
        
        let tempListView = UITableView(frame: self.view.bounds, style: .Grouped)
        tempListView.dataSource = self
        tempListView.delegate = self
        return tempListView
    }()
    
    private var items : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let a : Int? = 1
        //        let b : Int?? = 2
        //        print("\(a!)" + "\(b!!)")
        self.navigationItem.title = "Swift学习"
        
        self.edgesForExtendedLayout = .None
        
        self.view.addSubview(listView)
        
        items = ["水波纹效果","模拟建行app转动菜单","其他"]
        
        listView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CELL")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("CELL")!
        
        cell.textLabel?.text = items?.objectAtIndex(indexPath.row) as? String
        cell.textLabel?.textColor = UIColor.orangeColor()
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        
        return  cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var vc : UIViewController?
        
        switch(indexPath.row){
        case 0:
            vc = WaterPrinpleViewController()
            break;
            
        case 1:
            vc = DynamicMenuViewController()
            break;
            
        case 2:
            vc = OtherViewController()
            break;
            
        default:
            
            break;
        }
        vc!.navigationItem.title = items?.objectAtIndex(indexPath.row) as? String
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

