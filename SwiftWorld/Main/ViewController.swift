//
//  ViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/11.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit
//import SnapKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var listView: UITableView!
    
//    lazy private var listView: UITableView = {
//        
//        let tempListView = UITableView(frame: CGRectZero, style: .Grouped)
//        tempListView.dataSource = self
//        tempListView.delegate = self
//        return tempListView
//    }()
    
    private var items : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let a : Int? = 1
        //        let b : Int?? = 2
        //        print("\(a!)" + "\(b!!)")
        self.navigationItem.title = "Swift学习"
        
        self.edgesForExtendedLayout = .None

        items = ["水波纹效果","模拟建行app转动菜单","弹出框","其他","数据存储","cell模型","CoreText"]
        
        listView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CELL")
        
        //  自定义返回按钮  测试
        
        let backButton = UIButton(frame:CGRectMake(0,0,40,35))
        backButton.setTitle("返回", forState: .Normal)
//        backButton.backgroundColor = UIColor.lightGrayColor()
        backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0)
        backButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        backButton.addTarget(self, action: "clickBackButton:", forControlEvents: .TouchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    // 返回按钮点击事件
    func clickBackButton(button:UIButton){
        print("=======")
    }
    
    /**
     UITableViewDataSource
     */
    
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
            vc = PopViewController(nibName: "PopViewController", bundle: nil)
            break;
            
        case 3:
            vc = OtherViewController()
            break;
            
        case 4:
            vc = DataViewController()
            
        case 5:
            vc = TableViewModelController()
            
        case 6:
            vc = CoreTextViewController()
            
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

