//
//  CoreTextViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/6/3.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit

class CoreTextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = .None
        
        view.backgroundColor = UIColor.whiteColor()
        
        let cusView:CustomView = CustomView(showText: "123")
        cusView.backgroundColor = UIColor.orangeColor()
        cusView.frame = CGRectMake(10, 60, 80, 100)
        view.addSubview(cusView)
        
        
//        let v = UIView(frame: <#T##CGRect#>))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
